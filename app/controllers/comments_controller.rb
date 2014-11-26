class CommentsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end


  def create
    #@comment =
    # @comment.save
  end
end
