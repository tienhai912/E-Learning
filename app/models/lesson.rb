class Lesson < ApplicationRecord

  has_many :words, dependent: :destroy
  belongs_to :course, foreign_key: "course_id"

  validates :name, presence: true,
    length: {maximum: Settings.lesson.name_max}
end
