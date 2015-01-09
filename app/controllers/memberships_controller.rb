class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  before_action :check_membership_status

  def index
    @memberships = Membership.all
    @membership = Membership.new
    # @users = @project.users
    # Membership.where(product_id: @product.id)

    @project_memberships = @project.memberships

    # p "*"*88
    # p @project_memberships
    # p "*"*88
  end



  def create
    # ensure_project_owner
    # binding.pry
    # p @project.membership.length saved
    @membership = @project.memberships.new(membership_params)
    #@membership = Membership.new(params.require(:membersihp).permit(:user_id, :role))
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was added successfully"
    else
      # p @project.membership.length not saved in dB then hands both to view and tries to iterate over them
      @project_memberships = @project.memberships - [@membership]
      render :index
    end
  end


  def update
    # ensure_project_owner
    @membership = Membership.find(params[:id])
    @membership.update(membership_params)
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was updated successfully"
  end

  def destroy
    # ensure_project_owner
    @membership = Membership.find(params[:id])
    if @project.memberships.count != 1 || has_owner?(@project)
    @membership.destroy
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was removed successfully"
    else
    render :index
  end
end


  private
    def set_task
      @membership = @project.membership.find(params[:id])
    end

  def membership_params
    params.require(:membership).permit(:user_id, :role )
  end

  def check_membership_status
    membership = current_user.memberships.find_by_project_id(params[:project_id])
    return redirect_to root_path unless membership.present?

    @project_owner = membership.role == "owner"
  end

  def ensure_project_owner
    redirect_to root_path unless @project_owner
  end

end
