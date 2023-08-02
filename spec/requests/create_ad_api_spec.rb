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

    it 'sem sucesso, pois está faltando parâmetros' do
      post '/api/v1/ads', params: { ad: { platform_indentification: 'PlayerNumberOne',
                                          years_playing: 7, favorite_classes: :tank,
                                          hour_start: 360, hour_end: 480, voice_channel: true } }

      expect(response).to have_http_status 422

      res_body = response.parsed_body
      expect(res_body['errors']['game_mode']).to include 'não pode ficar em branco'
      expect(res_body['errors']['platform']).to include 'não pode ficar em branco'
    end
  end
end
