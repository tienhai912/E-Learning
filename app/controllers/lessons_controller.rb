class LessonsController < ApplicationController
  attr_reader :lesson

  def show
    @lesson = Lesson.find_by id: params[:id]
    @words = lesson.words.paginate page: params[:page], per_page: 50
  end
end
