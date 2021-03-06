class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_section, only: [:create]
  before_action :require_authorized_for_current_lesson, only: [:update]

  def create
    @lesson = current_section.lessons.create(lesson_params)
    @lesson.send_lesson_email
    redirect_to instructor_course_path(current_section.course)
  end

  def update
    current_lesson.update_attributes(lesson_params)
    render plain: 'updated!'
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video, :row_order_position)
  end

  def require_authorized_for_current_lesson
    return if current_lesson.section.course.user == current_user
    render plain: 'Unauthorized', status: :unauthorized
  end
end
