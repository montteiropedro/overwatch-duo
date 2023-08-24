require 'rails_helper'

describe 'API visualização dos modos de jogo' do
  context 'GET /api/v1/game_modes' do
    it 'retorna os modos de jogo cadastrado' do
      GameMode.create!(name: 'unranked')
      GameMode.create!(name: 'competitive')
      GameMode.create!(name: 'arcade')
      GameMode.create!(name: 'custom_game')

      get '/api/v1/game_modes'

      expect(response).to have_http_status 200
      res_body = response.parsed_body
      expect(res_body[0]['name']).to eq 'unranked'
      expect(res_body[1]['name']).to eq 'competitive'
      expect(res_body[2]['name']).to eq 'arcade'
      expect(res_body[3]['name']).to eq 'custom_game'
    end

    it 'retorna a quantidade de ad existente para cada modo de jogo' do
      user = User.create!(provider: 'discord', discord_id: '000000000000000000', discord_user: 'mydiscorduser')
      unranked = GameMode.create!(name: 'unranked')
      arcade = GameMode.create!(name: 'arcade')
      GameMode.create!(name: 'competitive')
      GameMode.create!(name: 'custom_game')
      Ad.create!(user:, game_mode: unranked, platform: :battle_net, platform_indentification: 'PlayerNumberOne',
                 years_playing: 7, favorite_classes: :tank, hour_start: '18:00', hour_end: '19:00',
                 voice_channel: true)
      Ad.create!(user:, game_mode: unranked, platform: :battle_net, platform_indentification: 'Ichigo',
                 years_playing: 7, favorite_classes: :tank, hour_start: '18:00', hour_end: '19:00',
                 voice_channel: true)
      Ad.create!(user:, game_mode: arcade, platform: :steam, platform_indentification: 'Kiriko',
                 years_playing: 1, favorite_classes: :support, hour_start: '18:00', hour_end: '19:00',
                 voice_channel: true)

      get '/api/v1/game_modes'

      expect(response).to have_http_status 200
      res_body = response.parsed_body
      expect(res_body[0]['ads_count']).to eq 2
      expect(res_body[1]['ads_count']).to eq 1
      expect(res_body[2]['ads_count']).to eq 0
      expect(res_body[3]['ads_count']).to eq 0
    end
  end
end
