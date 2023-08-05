class SessionsController < ApplicationController
  include ActionController::Cookies

  def new
    redirect_to ENV.fetch('DISCORD_OAUTH2_URL'), allow_other_host: true
  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    # debugger
    # puts "\n\n-> #{session.inspect}"

    redirect_to 'http://localhost:3001'
  end

  def current_user
    render json: { session: session[:discord]['expires'], time: Time.zone.now }
    if session[:discord] && session[:discord]['expires'] > Time.zone.now
    end

    raise Exception.new(status: 401, title: 'No active session found')
  end
end
