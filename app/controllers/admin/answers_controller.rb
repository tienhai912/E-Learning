module Admin
  class AnswersController < ApplicationController
    attr_reader :answer, :word

    before_action :logged_in_admin
    before_action :find_answer, only: %i(edit update destroy)
    before_action :find_word, only: %i(new create update)

    def new
      @answer = word.answers.build
    end

    def create
      @answer = word.answers.build answer_params
      if answer.save
        create_success
      else
        render :new
      end
    end

    def edit; end

    def update
      if answer.update_attributes answer_params
        flash[:success] = t "answer_updated"
        redirect_to admin_lesson_path word.lesson
      else
        render :edit
      end
    end

    def destroy
      answer.destroy
      flash[:success] = t "answer_deleted", answer: answer.content
      redirect_to request.referer || root_url
    end

    private

    def answer_params
      params.require(:answer).permit :content, :is_correct
    end

    def find_answer
      @answer = Answer.find_by id: params[:id]

      return if answer
      flash[:danger] = t "answer_not_found"
      redirect_to root_path
    end

    def find_word
      @word = Word.find_by id: params[:word_id]

      return if word
      flash[:danger] = t "word_not_found"
      redirect_to root_path
    end

    def create_success
      flash[:success] = t "answer_created"
      redirect_to admin_lesson_path word.lesson
    end
  end
end
