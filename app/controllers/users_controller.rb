class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    users_param = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = User.new(users_param)
    if @user.save
      flash[:success] = "User was successfully created"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    users_param=params.require(:user).permit(:first_name, :last_name, :email)
    @user = User.find(params[:id])
    if @user.update(users_param)
      flash[:success] = "User was successfully updated"
      redirect_to users_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User was successfully deleted"
      redirect_to users_path
    end
  end



end
