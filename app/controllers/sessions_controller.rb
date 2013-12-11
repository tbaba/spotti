class SessionsController < ApplicationController
  def new
  end

  def create
    auth = env['omniauth.auth']
    session[:auth] = {
      user_name: auth.extra.raw_info.screen_name,
      access_token: auth.credentials.token,
      access_token_secret: auth.credentials.secret,
      uid: auth.uid
    }

    redirect_to new_user_path
  end
end
