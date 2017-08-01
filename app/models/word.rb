class Word < ApplicationRecord
  belongs_to :lesson

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :content, presence: true,
    length: {maximum: Settings.word.content_max}
  validates :kind, presence: true
  validates :lesson_id, presence: true, numericality: {only_integer: true}

  enum kind: %i(single_choice multiple_choice)
end
