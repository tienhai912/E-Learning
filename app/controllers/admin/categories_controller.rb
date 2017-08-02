module Admin
  class CategoriesController < ApplicationController
    attr_reader :category

    before_action :logged_in_admin
    before_action :find_category, except: %i(index new create)

    def index
      @categories = Category.paginate page: params[:page]
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new category_params
      if category.save
        flash[:success] = t "category_created"
        redirect_to category
      else
        render :new
      end
    end

    def show
      @build_enroll = current_user.enrollments.build
      @courses = category.courses.paginate page: params[:page],
        per_page: Settings.course.per_page
    end

    def edit; end

    def update
      if category.update_attributes category_params
        flash[:success] = t "category_updated"
        redirect_to admin_category_path(category)
      else
        render :edit
      end
    end

    def destroy
      category.destroy
      flash[:success] = t "category_deleted", category: category.name
      redirect_to request.referer || root_url
    end

    private

    def category_params
      params.require(:category).permit :name, :description
    end

    def find_category
      @category = Category.find_by id: params[:id]

      return if category
      flash[:danger] = t "category_not_found"
      redirect_to root_path
    end
  end
end
