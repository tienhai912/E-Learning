class UsersController < ApplicationController
  before_action :find_user, except: :index

  def index
    @users = User.paginate page: params[:page]
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if user
    flash[:danger] = t "user_not_found_by_id"
    redirect_to root_path
  end
end
