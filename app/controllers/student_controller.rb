class StudentController < ApplicationController
  def index
    @students = Recruitment.by_students.includes(:user)
  end
end
