class Word < ApplicationRecord
  has_many :answers
  has_many :results
  belongs_to :lesson, foreign_key: "lesson_id"

  validates :content, presence: true,
    length: {maximum: 150}
  validates :kind, presence: true
  validates :lesson_id, presence: true
end
