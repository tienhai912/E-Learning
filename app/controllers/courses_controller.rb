class CoursesController < ApplicationController
  before_action :logged_in_user, only: :show

  attr_reader :course

  def show
    @course = Course.find_by id: params[:id]
    user_has_enrolled?
    @lessons = course.lessons.paginate page: params[:page],
      per_page: Settings.lesson.per_page
  end

  private

  def user_has_enrolled?
    return if course.has_enrolled? current_user

    flash[:danger] = t "you_havent_start_course"
    redirect_to root_path
  end
end
