class CoursesController < ApplicationController
  before_action :logged_in_user, only: :show

  attr_reader :course

  def show
    @course = Course.find_by id: params[:id]
    has_enrolled
    @lessons = course.lessons.paginate page: params[:page],
      per_page: Settings.lesson.per_page
  end

  private

  def has_enrolled
    enroll = Enroll.find_by course_id: course.id, user_id: current_user.id
    return if enroll.present?
    flash[:danger] = t "you_havent_start_course"
    redirect_to root_path
  end
end
