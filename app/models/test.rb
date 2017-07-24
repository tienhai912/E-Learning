class Test < ApplicationRecord
  has_many :results
  belongs_to :user, foreign_key: "user_id"
  belongs_to :lesson, foreign_key: "lesson_id"

  validates :user_id, presence: true
  validates :lesson_id, presence: true
end
