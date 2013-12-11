class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_signed_in?

  def current_user
    @_current_user ||= User.find session[:current_user]
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def user_signed_in?
    !!current_user
  end
end
