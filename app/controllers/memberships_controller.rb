class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @memberships = Membership.all
    @membership = Membership.new
  end



  def create
    @membership = @project.memberships.new(membership_params)
    if @membership.save
      redirect_to project_memberships_path(@project)
    else
      render :index
    end
  end

  private
    def set_task
      @membership = @project.membership.find(params[:id])
    end

  def membership_params
    params.require(:membership).permit(:user_id, :role )
  end


end
