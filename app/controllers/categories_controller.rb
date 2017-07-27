class CategoriesController < ApplicationController
  attr_reader :category

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find_by id: params[:id]
    @courses = category.courses.paginate page: params[:page],
      per_page: Settings.course.per_page
  end
end
