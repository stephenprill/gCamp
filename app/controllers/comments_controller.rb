class CommentsController < OrganizesController

    before_action do
      @project = Project.find(params[:project_id])
      @task = @project.tasks.find(params[:task_id])
    end


    def create
      @comment = @task.comments.new(params.require(:comment).permit(:comment, :user_id, :task_id))
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to project_task_path(@project, @task), notice: "Comment was successfully created."
      else
        redirect_to project_task_path(@project, @task)
      end
    end

end


#@comment =
# @comment.save
