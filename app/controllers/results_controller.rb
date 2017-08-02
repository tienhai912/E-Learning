class ResultsController < ApplicationController
  attr_reader :test, :supports

  before_action :authenticate_user!

  def new
    @test = current_user.tests.find_by id: params[:test_id]
    if test
      @supports = Supports::ResultSupports.new test: test,
        word_numerical: params[:word_numerical].to_i
    else
      flash[:danger] = t "find_test_not_found"
      redirect_to root_path
    end
  end

  def create
    result = Result.new result_params
    check_create_result result
  end

  private

  def check_create_result result
    if result.save
      if result.answer.is_correct
        flash[:success] = t "true_answer"
      else
        flash[:danger] = t "false_answer"
      end
      reload_page
    else
      redirect_to root_path
    end
  end

  def reload_page
    redirect_to new_result_path test_id: result_params[:test_id],
      word_numerical: params[:word_numerical]
  end

  def result_params
    params.require(:result).permit :test_id, :word_id, :answer_id
  end
end
