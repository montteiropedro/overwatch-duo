require 'rails_helper'

describe 'API visualização de anúncios' do
  context 'GET /api/v1/ads' do
    it 'retorna vazio caso o anúncio não exista' do
      get '/api/v1/ads/uuid-nao-existente'

      expect(response).to have_http_status 404
      expect(response.body).to be_blank
    end

    it 'retorna o anúncio caso exista' do
      unranked = GameMode.create!(name: 'unranked')
      arcade = GameMode.create!(name: 'arcade')
      user = User.create!(provider: 'discord', discord_id: '000000000000000000', discord_user: 'mydiscorduser')

      ad1 = Ad.create!(user:, game_mode: unranked, platform: :battle_net, platform_indentification: 'PlayerNumberOne',
                       years_playing: 7, favorite_classes: :tank, hour_start: '18:00', hour_end: '19:00',
                       voice_channel: true)
      Ad.create!(user:, game_mode: arcade, platform: :steam, platform_indentification: 'Kiriko',
                 years_playing: 1, favorite_classes: :support, hour_start: '18:00', hour_end: '19:00',
                 voice_channel: true)

      get "/api/v1/ads/#{ad1.id}"

      expect(response).to have_http_status 200
      res_body = response.parsed_body
      expect(res_body['id']).to eq ad1.id
      expect(res_body['game_mode']).to eq 'unranked'
      expect(res_body['platform']).to eq 'battle_net'
      expect(res_body['platform_indentification']).to eq 'PlayerNumberOne'
      expect(res_body['years_playing']).to eq 7
      expect(res_body['favorite_classes']).to eq 'tank'
      expect(res_body['hour_start']).to eq 1080
      expect(res_body['hour_end']).to eq 1140
      expect(res_body['voice_channel']).to eq true
    end
  end
end
