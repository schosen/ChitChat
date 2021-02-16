class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "You are logged in."
    else
      flash.now[:alert] = "Your email or password is invalid"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You are logged out!"
  end
end
