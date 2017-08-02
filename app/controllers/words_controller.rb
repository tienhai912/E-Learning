class WordsController < ApplicationController
  attr_reader :user

  def index
    @user = User.find_by id: params[:user_id]
    @words = user.words.paginate page: params[:page],
      per_page: 50
  end
end
