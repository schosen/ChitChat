class UsersController < ApplicationController
  has_one_attached :avatar

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
