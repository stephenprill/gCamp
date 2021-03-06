class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :ensure_current_user
  # test
  def current_user_member?
    @project.memberships.where(user_id: current_user).exists?
  end


  def ensure_current_user
    unless current_user
      session[:first_url] = request.url if request.get?
      redirect_to signin_path, notice: 'You must be logged in to access that action'
    end
  end

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end

  def owner?(project, user)
    @project.memberships.where(role: "owner", user_id: current_user).exists?
  end

  def redirect_to_previous_url_or_projects
    # binding.pry
    redirect_to (session[:first_url] || projects_path)
    session.delete(:first_url)
  end

  def has_owner?(project)
    owners = Membership.where(:project_id => project.id, :role => "owner")
    if owners.count >= 2
      true
    else
      false
    end
  end

  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :record_not_found

  def record_not_found
    render "public/404", status: 404, layout: false
  end

  helper_method :current_user
  helper_method :owner?
  helper_method :current_user_member?
  helper_method :has_owner?

end
