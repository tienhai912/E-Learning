module Admin
  class WordsController < ApplicationController
    attr_reader :word, :lesson

    before_action :logged_in_admin
    before_action :find_word, only: %i(edit update destroy)
    before_action :find_lesson, only: %i(new create)

    def new
      @word = lesson.words.build
    end

    def create
      @word = lesson.words.build word_params
      if word.save
        flash[:success] = t "word_created"
        redirect_to admin_lesson_path lesson
      else
        render :new
      end
    end

    def edit; end

    def update
      if word.update_attributes word_params
        flash[:success] = t "word_updated"
        find_lesson_update
        redirect_to admin_lesson_path lesson
      else
        render :edit
      end
    end

    def destroy
      word.destroy
      flash[:success] = t "word_deleted", word: word.content
      redirect_to request.referer || root_url
    end

    private

    def word_params
      params.require(:word).permit :content, :kind
    end

    def find_word
      @word = Word.find_by id: params[:id]

      return if word
      flash[:danger] = t "word_not_found"
      redirect_to root_path
    end

    def find_lesson
      @lesson = Lesson.find_by id: params[:lesson_id]

      return if lesson
      flash[:danger] = t "lesson_not_found"
      redirect_to root_path
    end

    def find_lesson_update
      @lesson = Lesson.find_by id: word.lesson_id

      return if lesson
      flash[:danger] = t "lesson_not_found"
      redirect_to root_path
    end
  end
end
