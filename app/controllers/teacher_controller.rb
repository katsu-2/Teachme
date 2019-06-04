class TeacherController < ApplicationController
  def index
    @users = User.where("person_type = 1").includes(:recruitments)
    @teachers = @users.map { |user| user }
  end
end
