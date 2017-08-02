module Wordlist
  class FiltersController < ApplicationController
    before_action :logged_in_user, only: :index
    def index
      params_select_box = params[:select_box]
      if params_select_box.blank?
        @words = Word.paginate page: params[:page], per_page: 50
      else
        @data_select_box = params_select_box
        @data_radio = params[:radio]
        check_select_box
        check_radio
      end
    end

    private

    def check_select_box
      if @data_select_box == "all"
        @temp = Word.all
      else
        category = Category.find_by name: @data_select_box
        @temp = category.words
      end
    end

    def check_radio
      params_page = params[:page]
      if @data_radio == "all"
        @words = @temp.paginate page: params_page, per_page: 50
      elsif @data_radio == "learned"
        @words = @temp.learned(current_user).paginate page: params_page,
          per_page: 50
      else
        @words = @temp.not_learned(current_user).paginate page: params_page,
          per_page: 50
      end
    end
  end
end
