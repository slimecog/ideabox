class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account created."
      redirect_to user_path(@user)
    else
      flash[:error] = "Username already exists. Log in or choose another."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:error] = "Must be logged in to continue."
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
