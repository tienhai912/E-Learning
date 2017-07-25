class CoursesController < ApplicationController
  def show
    @course = Course.find_by id: params[:id]
    @lessons = @course.lessons_in_course.paginate page: params[:page], per_page: 5
  end
end
