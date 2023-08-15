require 'rails_helper'

describe 'API para criação de anúncios' do
  context 'POST /api/v1/ads' do
    it 'com sucesso' do
      GameMode.create!(name: 'unranked')
      User.create!(provider: 'discord', discord_id: '000000000000000000')
      session = { discord: { 'id' => '000000000000000000' } }
      allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)

      post '/api/v1/ads', params: { ad: { game_mode: 'unranked', platform: :battle_net,
                                          platform_indentification: 'PlayerNumberOne',
                                          years_playing: 7, favorite_classes: :tank,
                                          hour_start: '18:00', hour_end: '18:30', voice_channel: true } }

      expect(response).to have_http_status :created
      expect(response.body).to include 'unranked'
      expect(response.body).not_to include 'competitive'
      expect(response.body).to include 'battle_net'
      expect(response.body).not_to include 'steam'
      expect(response.body).to include 'PlayerNumberOne'
      expect(response.body).to include '7'
      expect(response.body).to include 'tank'
      expect(response.body).to include '1080'
      expect(response.body).to include '1110'
    end

    context 'sem sucesso' do
      it 'pois está faltando parâmetros' do
        User.create!(provider: 'discord', discord_id: '000000000000000000')
        session = { discord: { 'id' => '000000000000000000' } }
        allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)

        post '/api/v1/ads', params: { ad: { platform_indentification: 'PlayerNumberOne',
                                            years_playing: 7, favorite_classes: :tank,
                                            hour_start: '18:00', hour_end: '19:00', voice_channel: true } }

        expect(response).to have_http_status 422
        res_body = response.parsed_body
        expect(res_body['errors']['game_mode']).to include 'é obrigatório(a)'
        expect(res_body['errors']['platform']).to include 'não pode ficar em branco'
      end

      it 'pois os parâmetro enviados são inválidos' do
        User.create!(provider: 'discord', discord_id: '000000000000000000')
        session = { discord: { 'id' => '000000000000000000' } }
        allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)

        post '/api/v1/ads', params: { ad: { game_mode: 'opção_inexistente', platform: :steam,
                                            platform_indentification: 'PlayerNumberOne',
                                            years_playing: 7, favorite_classes: :tank,
                                            hour_start: '18:00', hour_end: '19:00', voice_channel: true } }

        expect(response).to have_http_status 422
        expect(response.parsed_body['errors']['game_mode']).to include 'é obrigatório(a)'
      end

      it 'pois ocorreu um erro interno ao salvar os dados' do
        allow(Ad).to receive(:new).and_raise(ActiveRecord::ActiveRecordError)
        User.create!(provider: 'discord', discord_id: '000000000000000000')
        session = { discord: { 'id' => '000000000000000000' } }
        allow_any_instance_of(ApplicationController).to receive(:session).and_return(session)

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
