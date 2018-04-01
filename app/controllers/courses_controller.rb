class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
  end

  private

  # helper_method :current_course
    
end
