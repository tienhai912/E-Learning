class CoursesController < ApplicationController
  before_action :logged_in_user, only: :show
  before_action :logged_in_admin, only: %i(new create edit destroy update)
  before_action :find_course, only: %i(show edit destroy update)

  attr_reader :course

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    if course.save
      flash[:success] = t "course_created"
      redirect_to course
    else
      render :new
    end
  end

  def show
    @course = Course.find_by id: params[:id]
    user_has_enrolled?
    @lessons = course.lessons.paginate page: params[:page],
      per_page: Settings.lesson.per_page
  end

  def edit; end

  def update
    if course.update_attributes course_params
      flash[:success] = t "course_updated"
      redirect_to course
    else
      render :edit
    end
  end

  def destroy
    course.destroy
    flash[:success] = t "course_deleted", course: course.name
    redirect_to request.referrer || root_url
  end

  private

  def course_params
    params.require(:course).permit :category_id, :name, :description
  end

  def find_course
    @course = Course.find_by id: params[:id]
    return if course
    flash[:danger] = t "course_not_found"
    redirect_to root_path
  end

  def user_has_enrolled?
    return if current_user.is_admin || course.has_enrolled?(current_user)
    flash[:danger] = t "you_havent_start_course"
    redirect_to root_path
  end
end
