class TasksController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  before_action :set_task, only: [:show, :edit, :update, :destroy]




  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @project.tasks

    if params[:type] == "all"
      @tasks = @project.tasks
    elsif params[:type] == "incomplete"
      @tasks = @project.tasks.where(complete:false)

    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = @project.tasks.find(params[:id])
    @show_page = true
  end

  # GET /tasks/new
  def new
    @new_page = true
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @edit_page = true
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    if @task.destroy
      flash[:success] = "Task was successfully deleted"
    redirect_to tasks_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @project.task.find(params[:id])
      @task_new = false
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :due_date, :complete)
    end




end
