class Course < ApplicationRecord
  belongs_to :category

  has_many :lessons, dependent: :destroy

  validates :category_id, presence: true, numericality: {only_integer: true}
  validates :name, presence: true,
      length: {maximum: Settings.course.name_max}
  validates :description, presence: true,
      length: {maximum: Settings.course.description}

  def lessons_in_course
    Lesson.where "course_id = ?", id
  end
end
