class ProjectsController < ApplicationController

  #before_action :set_project,
  before_action :authorize_member, only: [:show]

  def index
    @projects = Project.all
    tracker_api = TrackerApi.new
    @tracker_projects = tracker_api.projects(current_user.pivotal_tracker_token)
  end

  def new
    @project = Project.new
  end

  def create
      @projects = Project.new
        project_params = params.require(:project).permit(:name)
      @project = Project.new(project_params)
    if @project.save
      Membership.create(
        :project => @project,
        :user => current_user,
        :role => :owner
      )
        # if @membership.save
        #   redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was added successfully"
      redirect_to project_tasks_path(@project), notice: "#{@project.name} was successfully created."
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project_params = params.require(:project).permit(:name)
    @project = @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project), notice: "#{@project.name} was successfully updated."
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path(@project), notice: "#{@project.name} was successfully destroyed."
    end
  end

#
  def authorize_member
    @project = Project.find(params[:id])
    unless current_user.admin || current_user_member?
      render file:'public/404', status: :not_found, layout: false
    end
  end



end
