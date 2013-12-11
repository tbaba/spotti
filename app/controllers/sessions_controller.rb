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

    if user = User.find_by_uid(session[:auth][:uid])
      session[:current_user] = user.id

      redirect_to user, notice: 'ログインしました'
    else
      redirect_to new_user_path, notice: 'ユーザー登録をお願いします'
    end
  end
end
