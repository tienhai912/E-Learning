class RelationshipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    user = User.find_by id: params[:following_id]
    current_user.follow user
    respond_to do |format|
      format.html
      format.js{redirect_to user}
    end
  end

  def destroy
    user = Relationship.find(params[:id]).following
    current_user.unfollow user
    respond_to do |format|
      format.html
      format.js{redirect_to user}
    end
  end
end
