class SpotsController < ApplicationController
  permits :description, :picture, :lat, :long

  before_action :set_user 

  def show user_id, id
    @spot = @user.spots.find id
  end

  def new user_id
    @spot = @user.spots.new
  end

  def create user_id, spot
    @spot = @user.spots.new spot

    if @spot.save
      redirect_to [@user, @spot], notice: '写真を投稿しました'
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end
end
