class Test < ApplicationRecord
  attr_reader :words_num, :right_words_num

  belongs_to :user
  belongs_to :lesson

  has_many :results, dependent: :destroy
  has_many :answers, through: :results
  has_many :words, through: :results

  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :lesson_id, presence: true, numericality: {only_integer: true}
  validates :created_at, presence: true

  def check_test
    @words_num = 0
    @right_words_num = 0
    words = Word.where lesson_id: lesson_id
    words.each do |word|
      @words_num += 1
      @right_words_num += 1 if word_right? word
    end
  end

  def word_right? word
    return false unless word.kind == test_answers(word)
    word.kind == test_correct_answers(word)
  end

  def test_answers word
    answers.where word_id: word.id
  end

  def test_correct_answers word
    test_answers(word).correct
  end
end
