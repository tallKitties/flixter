class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  helper_method :current_course, :current_lesson

  def current_course
    id = params[:id].nil? ? params[:course_id] : params[:id]
    @current_course ||= Course.find(id)
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end
