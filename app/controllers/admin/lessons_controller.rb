module Admin
  class LessonsController < ApplicationController
    attr_reader :lesson, :course

    before_action :logged_in_admin
    before_action :find_lesson, except: %i(index new create)
    before_action :find_course, only: %i(new create)

    def new
      @lesson = course.lessons.build
    end

    def create
      @lesson = course.lessons.build lesson_params
      if lesson.save
        flash[:success] = t "lesson_created"
        redirect_to admin_lesson_path(lesson)
      else
        render :new
      end
    end

    def show
      @words = lesson.words.paginate page: params[:page],
        per_page: Settings.lesson.per_page
    end

    def edit; end

    def update
      if lesson.update_attributes lesson_params
        flash[:success] = t "lesson_updated"
        redirect_to admin_lesson_path(lesson)
      else
        render :edit
      end
    end

    def destroy
      lesson.destroy
      flash[:success] = t "lesson_deleted", lesson: lesson.name
      redirect_to request.referer || root_url
    end

    private

    def lesson_params
      params.require(:lesson).permit :name
    end

    def find_lesson
      @lesson = Lesson.find_by id: params[:id]

      return if lesson
      flash[:danger] = t "lesson_not_found"
      redirect_to root_path
    end

    def find_course
      @course = Course.find_by id: params[:course_id]

      return if course
      flash[:danger] = t "course_not_found"
      redirect_to root_path
    end
  end
end
