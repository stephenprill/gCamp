class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @memberships = Membership.all
    @membership = Membership.new
    # @users = @project.users
    # Membership.where(product_id: @product.id)
    @project_memberships = @project.memberships
  end



  def create
    @membership = @project.memberships.new(membership_params)
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was succesfully created"
    else
      @project_memberships = @project.memberships - [@membership]
      render :index
    end
  end





  def update
    @membership = Membership.find(params[:id])
    @membership.update(membership_params)
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was succesfully updated"
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to project_path(@project), notice: "#{@membership.user.full_name} was succesfully deleted"
  end


  private
    def set_task
      @membership = @project.membership.find(params[:id])
    end

  def membership_params
    params.require(:membership).permit(:user_id, :role )
  end


end
