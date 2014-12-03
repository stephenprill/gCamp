class ProjectsController < ApplicationController

  def index
    @projects = Project.all

  end

  def new
    @project = Project.new
  end

  def create
      @projects = Project.new
      project_params = params.require(:project).permit(:name)
      @project = Project.new(project_params)
      if @project.save

        # if @membership.save
        #   redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was added successfully"
      redirect_to projects_path, notice: "#{@project.name} was successfully created."
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


end
