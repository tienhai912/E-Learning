class FollowersController < ApplicationController
  before_action :find_user, only: :index

  def index
    @title = t "followers"
    @users = user.followers.paginate page: params[:page]
    render "users/show_follow"
  end

  private

  def find_user
    @user = User.find_by id: params[:user_id]
    return if user
    flash[:danger] = t "user_not_found_by_id"
    redirect_to root_path
  end
end
