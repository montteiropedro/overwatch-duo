class SessionsController < ApplicationController
  include ActionController::Cookies

  def new
    render status: :ok, json: ENV.fetch('DISCORD_OAUTH2_URL')
  end

  def create
    User.from_omniauth(request.env['omniauth.auth'])
    create_session(request.env['omniauth.auth'])

    redirect_to ENV.fetch('WEB_URL'), allow_other_host: true
  end

  def destroy
    return render status: :unauthorized if cookies.encrypted[:_discord_session].nil?

    cookies.delete :_discord_session
    head :no_content
  end

  def current_user
    return render status: :unauthorized if cookies.encrypted[:_discord_session].nil?

    render status: :ok, json: {
      id: session[:discord]['id'],
      avatar: session[:discord]['avatar'],
      username: session[:discord]['username']
    }
  end

  private

  def create_session(auth)
    session[:discord] = {
      id: auth['uid'],
      avatar: auth['info']['image'],
      username: auth['info']['name'],
      expires_at: auth['credentials']['expires_at']
    }
  end
end
