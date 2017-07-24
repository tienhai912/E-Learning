class Answer < ApplicationRecord
  has_many :results
  belongs_to :word, foreign_key: "word_id"

  validates :word_id, presence: true
  validates :content, presence: true,
    length: {maximum: 150}
  validates :is_correct,
    presence: true
end
