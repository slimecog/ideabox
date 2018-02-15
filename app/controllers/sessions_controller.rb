class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in."
      redirect_to user_path(user)
    else
      flash[:error] = "Incorrect username or password. Try again."
      render :new
    end
  end

  def destroy
    session.destroy
    flash[:success] = "Successfully logged out."
    redirect_to root_path
  end
end
