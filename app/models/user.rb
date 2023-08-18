class User < ApplicationRecord
  has_many :ads, dependent: :restrict_with_exception

  def self.from_omniauth(auth)
    where(provider: auth.provider, discord_id: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.discord_id = auth.uid
      user.discord_user = auth.info.name
    end
  end
end
