class UsersController < ApplicationController
  permits :user_name, :handle_name, :email, :remote_avatar_url

  def show id
    @user = User.find id
  end

  def new
    @user = User.new session[:auth]
  end

  def create user
    @user = User.new user
    @user.uid = session[:auth][:uid]
    @user.access_token = session[:auth][:access_token]
    @user.access_token_secret = session[:auth][:access_token_secret]

    if @user.save
      session.delete :auth
      session[:current_user] = @user.id

      redirect_to @user, notice: 'ユーザー登録が完了しました'
    else
      render 'new'
    end
  end
end
