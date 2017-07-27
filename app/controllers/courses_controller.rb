class CoursesController < ApplicationController
  attr_reader :course

  def show
    @course = Course.find_by id: params[:id]
    @lessons = course.lessons.paginate page: params[:page],
      per_page: Settings.lesson.per_page
  end
end
