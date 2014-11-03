class ProjectsController < ApplicationController

  def index
    @projects = Project.all

  end

  def new
    @projects = Project.new
  end

  def create
    @projects = Project.new
    project_params = params.require(:project).permit(:name)
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_path
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
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path(@project)
  end


end
