class UsersController < ApplicationController
  has_one_attached :avatar

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:bio)
  end

  def index
  end

  def update_profile
    current_user.update(bio: user_params[:bio])
    redirect_to user_path(current_user)
  end
end
