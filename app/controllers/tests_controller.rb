class TestsController < ApplicationController
  attr_reader :results

  before_action :authenticate_user!

  def create
    test = Test.new user_id: current_user.id, lesson_id: params[:lesson_id]
    if test.save
      redirect_to new_result_path(test_id: test.id, word_numerical: 0)
    else
      redirect_to root_path
    end
  end

  def show
    test = Test.find_by id: params[:id]
    if test
      init_params_show test
    else
      flash[:danger] = t "find_test_not_found"
      redirect_to root_path
    end
  end

  private

  def init_params_show test
    @results = test.results
    @lesson_name = test.lesson.name
    @results_count = results.count
    count_answer_true
  end

  def count_answer_true
    @count_answer_true = 0
    results.each do |result|
      @count_answer_true += 1 if result.answer.is_correct
    end
  end
end
