class SessionsController < ApplicationController
  include ActionController::Cookies

  def new
    render status: :ok, json: ENV.fetch('DISCORD_OAUTH2_URL')
  end

  def create
    User.from_omniauth(request.env['omniauth.auth'])
    create_session(request.env['omniauth.auth'])

    redirect_to ENV.fetch('WEB_URL')
  end

  def current_user
    return render status: :unauthorized if cookies.encrypted[:_discord_session].nil?

    render status: :ok, json: {
      avatar: session[:discord]['avatar'],
      username: session[:discord]['username']
    }
  end

  private

  def create_session(auth)
    session[:discord] = {
      expires_at: auth['credentials']['expires_at'],
      avatar: auth['info']['image'],
      username: auth['info']['name']
    }
  end
end
