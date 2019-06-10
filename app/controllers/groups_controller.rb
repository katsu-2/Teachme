class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_group_user, only: [:index]

  def index
    my_group_ids = @current_group_users.each_with_object([]) do |group, arr|
      arr << group.group.id
    end

    # @anotherGroupUsers = GroupUser.where(group_id: myGroupIds).where.not(user_id: current_user.id)
    @another_group_users = GroupUser.where(group_id: my_group_ids).where.not(user_id: current_user.id)
  end


  def create
    @group = Group.create(group_params)

    redirect_to groups_path
  end


  private
  def group_params
    params.require(:group).permit(:id, user_ids: [])
  end

  def set_current_group_user
    @current_group_users ||= current_user.group_users.includes(:group)
  end

end
