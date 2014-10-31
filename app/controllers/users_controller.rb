class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    users_param = params.require(:user).permit(:name, :email)
    @user = User.new(users_param)
    @user.save
    redirect_to users_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    users_param = params.require(:user).permit(:name, :email)
    @user = User.find(params[:id])
    @user.update(users_param)
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end



end
