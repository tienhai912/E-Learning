class Test < ApplicationRecord
  attr_reader :words_num, :right_words_num

  belongs_to :user
  belongs_to :lesson

  has_many :results, dependent: :destroy
  has_many :answers, through: :results
  has_many :words, through: :results

  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :lesson_id, presence: true, numericality: {only_integer: true}
end
