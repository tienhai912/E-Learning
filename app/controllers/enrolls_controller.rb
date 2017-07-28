class EnrollsController < ApplicationController
  attr_reader :user, :course, :enroll

  before_action :find_user
  before_action :find_course, only: :create

  def new
    @enroll = user.enrollments.build
  end

  def create
    @enroll = user.enrollments.build enroll_params
      .merge(status: :not_finish, date_start: Time.now.utc)
    if enroll.save
      redirect_to course
    else
      flash[:danger] = t "cant_build_enroll"
      redirect_to root_path
    end
  end

  private

  def enroll_params
    params.require(:enroll).permit :course_id
  end

  def find_course
    @course = Course.find_by id: enroll_params[:course_id]
    missing_params unless course
  end

  def find_user
    @user = User.find_by id: params[:user_id]
    missing_params unless user
  end

  def missing_params
    flash[:danger] = t "cant_find_params"
    redirect_to root_path
  end
end
