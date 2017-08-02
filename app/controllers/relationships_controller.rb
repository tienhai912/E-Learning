class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :find_user, only: :index
  before_action :user_create_relationship, only: :create
  before_action :user_destroy_relationship, only: :destroy
  before_action :support, only: %i(index create destroy)

  def index
    @users = user.send(params[:type]).paginate page: params[:page]
  end

  def create
    respond_to do |format|
      format.html{redirect_to user}
      format.js
    end
  end

  def destroy
    respond_to do |format|
      format.html{redirect_to user}
      format.js
    end
  end

  private

  def support
    @supports = Supports::RelationshipSupports.new user_id: user.id,
      current_user: current_user
  end

  def user_create_relationship
    @user = User.find_by id: params[:following_id]
    check_user
    current_user.follow user
  end

  def user_destroy_relationship
    @user = Relationship.find_by(id: params[:id]).following
    check_user
    current_user.unfollow user
  end

  def find_user
    @user = User.find_by id: params[:user_id]
    check_user
  end

  def check_user
    return if user
    flash[:danger] = t "user_not_found_by_id"
    redirect_to root_path
  end
end
