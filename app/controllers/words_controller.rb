class WordsController < ApplicationController
  before_action :logged_in_user, only: :index
  def index
    @words ||= Word.paginate page: params[:page],
      per_page: 50
  end
end
