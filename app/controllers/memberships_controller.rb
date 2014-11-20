class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @memberships = Membership.all
    @membership = Membership.new
  end

  def create
    @membership = @project.membership.new(membership_params)
    if @membership.save
      redirect_to project_path(@project, @membership)
    else
      render :new
    end
  end

  private
    def set_task
      @membership = @project.membership.find(params[:id])
    end

  def membership_params
    params.require(:task).permit(:project_id, :user_id, :role )
  end


end
