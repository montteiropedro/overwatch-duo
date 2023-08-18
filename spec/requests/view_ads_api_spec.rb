require 'rails_helper'

describe 'API visualização de anúncios' do
  context 'GET /api/v1/ads' do
    it 'retorna um array vazio caso nao tenham anúncios cadastrados' do
      get '/api/v1/ads'

      expect(response).to have_http_status 200
      expect(response.parsed_body).to be_empty
    end

    it 'retorna os anúncios cadastrados' do
      unranked = GameMode.create!(name: 'unranked')
      arcade = GameMode.create!(name: 'arcade')
      user = User.create!(provider: 'discord', discord_id: '000000000000000000', discord_user: 'mydiscorduser')

      ad1 = Ad.create!(user:, game_mode: unranked, platform: :battle_net, platform_indentification: 'PlayerNumberOne',
                       years_playing: 7, favorite_classes: :tank, hour_start: '18:00', hour_end: '19:00',
                       voice_channel: true)
      ad2 = Ad.create!(user:, game_mode: arcade, platform: :steam, platform_indentification: 'Kiriko',
                       years_playing: 1, favorite_classes: :support, hour_start: '18:00', hour_end: '19:00',
                       voice_channel: true)

      get '/api/v1/ads'

      expect(response).to have_http_status 200
      res_body = response.parsed_body
      expect(res_body.length).to eq 2
      expect(res_body[0]['id']).to eq ad1.id
      expect(res_body[0]['game_mode']).to eq 'unranked'
      expect(res_body[0]['platform']).to eq 'battle_net'
      expect(res_body[0]['platform_indentification']).to eq 'PlayerNumberOne'
      expect(res_body[0]['years_playing']).to eq 7
      expect(res_body[0]['favorite_classes']).to eq 'tank'
      expect(res_body[0]['hour_start']).to eq 1080
      expect(res_body[0]['hour_end']).to eq 1140
      expect(res_body[0]['voice_channel']).to eq true
      expect(res_body[1]['id']).to eq ad2.id
      expect(res_body[1]['game_mode']).to eq 'arcade'
      expect(res_body[1]['platform']).to eq 'steam'
      expect(res_body[1]['platform_indentification']).to eq 'Kiriko'
      expect(res_body[1]['years_playing']).to eq 1
      expect(res_body[1]['favorite_classes']).to eq 'support'
      expect(res_body[1]['hour_start']).to eq 1080
      expect(res_body[1]['hour_end']).to eq 1140
      expect(res_body[1]['voice_channel']).to eq true
    end
  end
end
