class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recruitments = Recruitment.where(user_id: @user_id)
  end
end
