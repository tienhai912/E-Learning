class UsersController < ApplicationController
  before_action :find_user, only: :show

  attr_reader :user

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @tests = user.tests.paginate page: params[:page]
    @supports = Supports::UserSupports.new user: user,
      current_user: current_user
  end

  private

  def find_user
    @user = User.find_by id: params[:id]

    return if user
    flash[:danger] = t "user_not_found_by_id"
    redirect_to root_path
  end
end
