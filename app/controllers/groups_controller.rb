class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @currentGroupUsers = current_user.group_users
    @myGroupIds = []

    @currentGroupUsers.includes(:group).each do |group|
      @myGroupIds << group.group.id
    end

    @anotherGroupUsers = GroupUser.where(group_id: @myGroupIds).where.not(user_id: current_user.id)
  end


  def create
    current_user_groups = GroupUser.where(user_id: current_user.id).map(&:group)
    group = GroupUser.where(group: current_user_groups, user_id: params[:user_id]).map(&:group).first
    if group.blank?
      @group = Group.create(group_params)
      GroupUser.create(group: group, user_id: current_user.id)
      GroupUser.create(group: group, user_id: params[:user_id])
    end
    redirect_to groups_path
  end


  private
  def group_params
    params.require(:group).permit(:id, user_ids: [])
  end

end
