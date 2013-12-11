class SessionsController < ApplicationController
  def new
  end

  def create
    auth = env['omniauth.auth']
    session[:auth] = {
      user_name: auth.extra.raw_info.screen_name,
      access_token: auth.credentials.token,
      access_token_secret: auth.credentials.secret,
      uid: auth.uid,
      remote_avatar_url: auth.info.image
    }

    if user = User.find_by_uid(session[:auth][:uid])
      session[:current_user] = user.id

      redirect_to user, notice: 'ログインしました'
    else
      redirect_to new_user_path, notice: 'ユーザー登録をお願いします'
    end
  end

  def destroy id
    session.delete :current_user
    redirect_to new_session_path, notice: 'ログアウトしました'
  end
end
