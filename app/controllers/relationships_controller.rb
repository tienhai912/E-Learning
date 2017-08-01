class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :find_user, only: :index
  before_action :user_create_relationship, only: :create
  before_action :user_destroy_relationship, only: :destroy

  def index
    @users = user.send(params[:type]).paginate page: params[:page]
  end

  def create
    @relationship_destroy =
      current_user.active_relationships.find_by following_id: @user.id
    respond_to do |format|
      format.html{redirect_to user}
      format.js
    end
  end

  def destroy
    @relationship_build = current_user.active_relationships.build
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private

  def user_create_relationship
    @user = User.find_by id: params[:following_id]
    current_user.follow user
  end

  def user_destroy_relationship
    @user = Relationship.find_by(id: params[:id]).following
    current_user.unfollow user
  end

  def find_user
    @user = User.find_by id: params[:user_id]
    return if user

    flash[:danger] = t "user_not_found_by_id"
    redirect_to root_path
  end
end
