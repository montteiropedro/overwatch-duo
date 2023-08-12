Rails.application.config.middleware.use OmniAuth::Builder do
  provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET'], scope: 'connections identify', provider_ignores_state: true
end
