class ResultsController < ApplicationController
  attr_reader :supports

  before_action :authenticate_user!

  def new
    @new_result = Result.new
    @supports = Supports::ResultSupports.new test_id: params[:test_id],
      word_numerical: params[:word_numerical].to_i,
      current_user: current_user
    return if supports.test
    flash[:danger] = t "find_test_not_found"
    redirect_to root_path
  end

  def create
    word = Word.find_by id: params[:result][:word_id]
    if word.single_choice?
      create_result_single
    else
      create_result_multiple
    end
    reload_page
  end

  private

  def create_result_multiple
    results = []
    result_params_multiple[:answer_id].each do |answer_id|
      result = Result.new test_id: result_params_multiple[:test_id],
        word_id: result_params_multiple[:word_id],
        answer_id: answer_id
      check_create_result result
      results.push result
    end
    show_check_result results
  end

  def create_result_single
    result = Result.new result_params_single
    if result.save
      if result.answer.is_correct
        flash[:success] = t "true_answer"
      else
        flash[:danger] = t "false_answer"
      end
    else
      redirect_to root_path
    end
  end

  def check_create_result result
    return if result.save
    flash[:danger] = t "save_result_error"
    redirect_to root_path
  end

  def check_result_multiple results
    word = Word.find_by id: result_params_multiple[:word_id]
    return false if results.size != word.answers.correct.length
    results.each do |result|
      return false unless result.answer.is_correct
    end
    true
  end

  def reload_page
    redirect_to new_result_path test_id: params[:result][:test_id],
      word_numerical: params[:word_numerical]
  end

  def result_params_single
    params.require(:result).permit :test_id, :word_id, :answer_id
  end

  def result_params_multiple
    params.require(:result).permit :test_id, :word_id, answer_id: []
  end

  def show_check_result results
    if check_result_multiple results
      flash[:success] = t "true_answer"
    else
      flash[:danger] = t "false_answer"
    end
  end
end
