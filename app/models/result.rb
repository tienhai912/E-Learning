class Result < ApplicationRecord
  belongs_to :test
  belongs_to :answer
  belongs_to :word

  validates :test_id, presence: true, numericality: {only_integer: true}
  validates :answer_id, presence: true, numericality: {only_integer: true}
  validates :word_id, presence: true, numericality: {only_integer: true}
end
