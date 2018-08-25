class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_enrolled, only: [:show]

  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_user_enrolled
    if current_user.enrolled_in?(current_lesson.section.course)
      redirect_to lesson_path(current_lesson.section.course)
    else
      redirect_to course_path, alert: 'You must enroll before viewing this lesson'
    end
  end 
end