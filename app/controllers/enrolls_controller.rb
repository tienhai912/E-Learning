class EnrollsController < ApplicationController
  def new
    @enroll = Enroll.new
  end

  def create
    current_course_id = params[:course_id]
    @enroll = Enroll.create user_id: params[:user_id],
      course_id: current_course_id, status: 1, date_start: Time.now.utc
    redirect_to Course.find_by id: current_course_id
  end
end
