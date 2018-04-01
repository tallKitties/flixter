class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_for_current_lesson

  def show
  end

  private

  def require_enrolled_for_current_lesson
    course = current_lesson.section.course
    unless current_user.enrolled_in?(course)
      redirect_to course_path(course), alert: "You need to be enrolled in \"#{course.title}\" to view its lesson \"#{current_lesson.title}\" "
    end
  end
end
