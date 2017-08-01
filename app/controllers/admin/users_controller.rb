module Admin
  class UsersController < ApplicationController
    attr_reader :user

    def index
      @users = User.all.paginate page: params[:page],
        per_page: Settings.user.per_page
    end

    def destroy
      find_user
      user.destroy
      flash[:success] = t "user_deleted", user: user.name
      redirect_to request.referer || root_url
    end

    private

    def find_user
      @user = User.find_by id: params[:id]

      return if user
      flash[:danger] = t "user_not_found"
      redirect_to root_path
    end
  end
end
