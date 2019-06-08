class StudentController < ApplicationController
  def index
    @students = Recruitment.by_student.includes(:user)
  end
end
