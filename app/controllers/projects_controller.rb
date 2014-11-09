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
    if @project.save
      flash[:success] = "Project was successfully created"
    redirect_to projects_path
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
      flash[:success] = "Project was successfully updated"
    redirect_to project_path(@project)
  end
    end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:success] = "Project was successfully destroyed"
    redirect_to projects_path(@project)
  end
    end


end
