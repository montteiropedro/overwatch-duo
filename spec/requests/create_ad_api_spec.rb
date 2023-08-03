require 'rails_helper'

describe 'API para criação de anúncios' do
  context 'POST /api/v1/ads' do
    it 'com sucesso' do
      post '/api/v1/ads', params: { ad: { game_mode: :unranked, platform: :battle_net,
                                          platform_indentification: 'PlayerNumberOne',
                                          years_playing: 7, favorite_classes: :tank,
                                          hour_start: 360, hour_end: 480, voice_channel: true } }

      expect(response).to have_http_status :created
      expect(response.body).to include 'unranked'
      expect(response.body).not_to include 'competitive'
      expect(response.body).to include 'battle_net'
      expect(response.body).not_to include 'steam'
      expect(response.body).to include 'PlayerNumberOne'
      expect(response.body).to include '7'
      expect(response.body).to include 'tank'
      expect(response.body).to include '360'
      expect(response.body).to include '480'
    end

    context 'sem sucesso' do
      it 'pois está faltando parâmetros' do
        post '/api/v1/ads', params: { ad: { platform_indentification: 'PlayerNumberOne',
                                            years_playing: 7, favorite_classes: :tank,
                                            hour_start: 360, hour_end: 480, voice_channel: true } }

        expect(response).to have_http_status 422

        res_body = response.parsed_body
        expect(res_body['errors']['game_mode']).to include 'não pode ficar em branco'
        expect(res_body['errors']['platform']).to include 'não pode ficar em branco'
      end

      it 'pois os parâmetro enviados são inválidos' do
        post '/api/v1/ads', params: { ad: { game_mode: 'opção_inexistente', platform: :steam,
                                            platform_indentification: 'PlayerNumberOne',
                                            years_playing: 7, favorite_classes: :tank,
                                            hour_start: 360, hour_end: 480, voice_channel: true } }

        expect(response).to have_http_status 400

        res_body = response.parsed_body
        expect(res_body['error']).to eq 'erro nos parâmetros enviados'
        expect(res_body['messages']['game_mode']).to eq 'não é válido'
      end

      it 'pois ocorreu um erro interno ao salvar os dados' do
        allow(Ad).to receive(:new).and_raise(ActiveRecord::ActiveRecordError)

        post '/api/v1/ads', params: { ad: { game_mode: :unranked, platform: :steam,
                                            platform_indentification: 'PlayerNumberOne',
                                            years_playing: 7, favorite_classes: :tank,
                                            hour_start: 360, hour_end: 480, voice_channel: true } }

        expect(response).to have_http_status 500

        res_body = response.parsed_body
        expect(res_body['error']).to eq 'erro interno da aplicação'
      end
    end
  end
end
