class UsersController < ApplicationController
  # before_action :set_group, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recruitments = Recruitment.where(user_id: @user_id)
  end

  # private
  # def set_group
  #   @group = Group.find(params[:id])
  # end
end
