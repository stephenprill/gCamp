class UsersController < ApplicationController

  before_action :only => [:edit] do
    @user = User.find(params[:id])
    if current_user.admin || @user == current_user
    else
      raise AccessDenied
    end
  end

  def index
    #if   #.admin
    @users = []
    current_user.projects.each do |project|
      @users += project.users
    end
      @users = @users.uniq
  end

  def new
    @user = User.new
  end

  def create
    users_param = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :pivotal_tracker_token)
    @user = User.new(users_param)
    if @user.save
      redirect_to users_path, notice: "#{@user.full_name} was successfully created"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    users_param=params.require(:user).permit(:first_name, :last_name, :email, :password, :password_digest, :pivotal_tracker_token)
    @user = User.find(params[:id])
    if @user.update(users_param)
      redirect_to users_path, notice: "#{@user.full_name} was successfully updated"
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
      redirect_to users_path, notice: "#{@user.full_name} was successfully deleted"
    end
  end

end
