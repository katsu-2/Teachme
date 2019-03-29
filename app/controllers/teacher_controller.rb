class TeacherController < ApplicationController
  def index
    @teachers = []
    @users = User.where("person_type = 1")
    @users.each do |user|
      @teachers << user
    end
  end
end
