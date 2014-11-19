class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @membership = Membership.all
  end

  def task_params
    params.require(:task).permit(:project_id, :user_id, :role )
  end


end
