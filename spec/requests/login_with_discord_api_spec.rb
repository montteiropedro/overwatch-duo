require 'rails_helper'

describe 'API para login com discord' do
  context 'auth/discord' do
    it 'retorna link para o login via discord ' do
      get '/auth/discord'

      expect(response.status).to eq 200
      expect(response.body).to include 'https://discord.com/api/oauth2'
    end
  end

  context 'auth/discord/callback' do
    it 'cria o usuário e redireciona para a web' do
      fake_response = Hashie::Mash.new(JSON.parse(Rails.root.join('spec/support/discord_user.json').read))
      OmniAuth.config.mock_auth[:discord] = fake_response
      get '/auth/discord/callback'

      expect(User.all.size).to eq 1
      expect(User.last.discord_user).to eq 'mydiscorduser'
      expect(response).to redirect_to 'http://localhost:3001'
    end
  end
end
