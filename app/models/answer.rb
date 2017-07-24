class Answer < ApplicationRecord
  belongs_to :word

  has_many :results, dependent: :destroy

  validates :word_id, presence: true, numericality: {only_integer: true}
  validates :content, presence: true,
    length: {maximum: Settings.answer.content_max}
  validates :is_correct, inclusion: {in: [true, false]}
end
