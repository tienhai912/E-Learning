module Wordlist
  class FiltersController < ApplicationController
    attr_reader :temp

    before_action :logged_in_user, only: :index

    def index
      if params[:select_box].blank?
        @words = Word.paginate page: params[:page], per_page: 50
      else
        check_select_box
        check_radio
      end
    end

    private

    def check_select_box
      get_select_box = @data_select_box = params[:select_box]
      if get_select_box == "all"
        @temp = Word.all
      else
        category = Category.find_by name: get_select_box
        @temp = category.words
      end
    end

    def check_radio
      get_radio = @data_radio = params[:radio]
      params_page = params[:page]
      @words =
        if get_radio == "all"
          temp.paginate page: params_page, per_page: 50
        elsif get_radio == "learned"
          temp.learned(current_user).paginate page: params_page, per_page: 50
        else
          temp.not_learned(current_user).paginate page: params_page, per_page: 50
        end
    end
  end
end
