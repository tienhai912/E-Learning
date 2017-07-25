class Lesson < ApplicationRecord
  belongs_to :course

  has_many :words, dependent: :destroy
  has_many :tests, dependent: :destroy

  validates :course_id, presence: true, numericality: {only_integer: true}
  validates :name, presence: true, length: {maximum: Settings.lesson.name_max}
end
