class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  helper_method :current_course, :current_lesson, :current_section

  def current_course
    id = params.key?(:course_id) ? params[:course_id] : params[:id]
    @current_course ||= Course.find(id)
  end

  def current_lesson
    id = params.key?(:lesson_id) ? params[:lesson_id] : params[:id]
    @current_lesson ||= Lesson.find(id)
  end

  def current_section
    id = params.key?(:section_id) ? params[:section_id] : params[:id]
    @current_section ||= Section.find(id)
  end

  def require_authorized_for_current_section
    return if current_section.course.user == current_user
    render plain: 'Unauthorized', status: :unauthorized
  end
end
