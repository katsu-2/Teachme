class StudentController < ApplicationController
  def index
    @users = User.where("person_type = 0")
    @students = @users.map { |user| user }
  end
end
