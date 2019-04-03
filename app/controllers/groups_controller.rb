class GroupsController < ApplicationController

  def index
    @currentGroupUsers = current_user.group_users
    @myGroupIds = []

    @currentGroupUsers.includes(:group).each do |group|
      @myGroupIds << group.group.id
    end

    @anotherGroupUsers = GroupUser.where(group_id: @myGroupIds).where.not(user_id: current_user.id)
  end


  def create
    current_user_groups = GroupUser.where(user_id: current_user.id)
    group = GroupUser.where(group: current_user_groups, user_id: params[:id])
    if group.present?
      redirect_to groups_path
    else
      group = Group.create(group_params)
      GroupUser.create(group: group, user_id: current_user.id)
      GroupUser.create(group: group, user_id: params[:user_id])
      redirect_to group_messages_path(@group)
    end

  end

  private
  def group_params
    params.require(:group).permit(:id, user_ids: [])
  end

end
