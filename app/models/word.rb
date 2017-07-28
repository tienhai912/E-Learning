class Word < ApplicationRecord
  belongs_to :lesson

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :content, presence: true,
    length: {maximum: Settings.word.content_max}
  validates :kind, presence: true, numericality: {only_integer: true}
  validates :lesson_id, presence: true, numericality: {only_integer: true}

  def right_answers
    Answer.where "word_id = ? AND is_correct = ?", id, true
  end
end
