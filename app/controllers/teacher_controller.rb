class TeacherController < ApplicationController
  def index
    @users = User.where("person_type = 1")
    @teachers = @users.map { |user| user }
  end
end
