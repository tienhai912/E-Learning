class LessonsController < ApplicationController
  attr_reader :lesson, :user

  def index
    @user = User.find_by id: params[:user_id]
    @lessons = user.lessons.paginate page: params[:page],
      per_page: Settings.lesson.per_page
  end

  def show
    @lesson = Lesson.find_by id: params[:id]
    lesson_exist
    @words = lesson.words.paginate page: params[:page],
      per_page: Settings.lesson.words_per_page
  end

  private

  def lesson_exist
    return if lesson
    flash[:danger] = t "no_lesson_found"
    redirect_to root_path
  end
end
