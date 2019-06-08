class TeacherController < ApplicationController
  def index
    @teachers = Recruitment.by_teachers.includes(:user)
  end
end
