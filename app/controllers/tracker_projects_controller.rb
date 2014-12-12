class TrackerProjectsController < ApplicationController

  def show
    tracker_projects = TrackerApi.new
    @tracker_projects = tracker_projects.stories(current_user.pivotal_tracker_token, params[:id])
  end

end
