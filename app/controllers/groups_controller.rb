class GroupsController < ApplicationController

  def index
    @currentGroupUsers = current_user.group_users
    myGroupIds = []

    @currentGroupUsers.each do |c_user|
      myGroupIds << c_user.group.id
    end


  end


  def create
    @group = Group.create(group_params)
  end

  private
  def group_params
  end
end
