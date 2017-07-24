class Result < ApplicationRecord
  belongs_to :test, foreign_key: "test_id"
  belongs_to :answer, foreign_key: "answer_id"
  belongs_to :word, foreign_key: "word_id"

  validates :test_id, presence: true
  validates :answer_id, presence: true
  validates :word_id, presence: true
end
