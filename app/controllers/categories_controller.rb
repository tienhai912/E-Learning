class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find_by id: params[:id]
    @courses = @category.courses_in_category.paginate page: params[:page], per_page: 5
  end
end
