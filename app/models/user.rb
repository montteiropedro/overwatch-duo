class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(provider: auth.provider, discord_id: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.discord_id = auth.uid
    end
  end
end
