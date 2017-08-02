class Test < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  has_many :results, dependent: :destroy

  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :lesson_id, presence: true, numericality: {only_integer: true}
end
