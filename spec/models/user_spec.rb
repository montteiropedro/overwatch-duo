require 'rails_helper'
require 'hashie'

RSpec.describe User, type: :model do
  describe '.from_omniauth' do
    it 'procura usuário e cadastra no banco de dados, caso não exista' do
      User.create!(provider: 'discord', discord_id: '000000000000000000', discord_user: 'mydiscorduser')
      auth1 = Hashie::Mash.new({ provider: 'discord', uid: '000000000000000000', info: { name: 'mydiscorduser' } })
      auth2 = Hashie::Mash.new({ provider: 'discord', uid: '111111111111111111', info: { name: 'otherdiscorduser' } })

      User.from_omniauth(auth1)
      user = User.from_omniauth(auth2)

      expect(User.all.size).to eq 2
      expect(user.provider).to eq 'discord'
      expect(user.discord_id).to eq '111111111111111111'
      expect(user.discord_user).to eq 'otherdiscorduser'
    end
  end
end
