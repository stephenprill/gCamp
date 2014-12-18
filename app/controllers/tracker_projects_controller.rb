class TrackerProjectsController < ApplicationController

  def show
    tracker_projects = TrackerApi.new
    @tracker_stories = tracker_projects.stories(current_user.pivotal_tracker_token, params[:id])
    # @project = Project.find(params[:id])
  end

end
