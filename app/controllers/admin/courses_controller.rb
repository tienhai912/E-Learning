module Admin
  class CoursesController < ApplicationController
    attr_reader :course

    before_action :logged_in_admin
    before_action :find_course, except: %i(index new create)

    def new
      @course = Course.new
    end

    def create
      @course = Course.new course_params
      if course.save
        flash[:success] = t "course_created"
        redirect_to admin_course_path(course)
      else
        render :new
      end
    end

    def show
      @lessons = course.lessons.paginate page: params[:page],
        per_page: Settings.lesson.per_page
    end

    def edit; end

    def update
      if course.update_attributes course_params
        flash[:success] = t "course_updated"
        redirect_to admin_course_path(course)
      else
        render :edit
      end
    end

    def destroy
      course.destroy
      flash[:success] = t "course_deleted", course: course.name
      redirect_to request.referer || root_url
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
  end
end
