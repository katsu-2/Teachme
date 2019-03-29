class StudentController < ApplicationController
  def index
    @students = []
    @users = User.where("person_type = 0")
    @users.each do |user|
      @students << user
    end
  end
end
