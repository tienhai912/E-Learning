class Course < ApplicationRecord

  has_many :lessons, dependent: :destroy
  belongs_to :category, foreign_key: "category_id"

  validates :name, presence: true,
      length: {maximum: Settings.course.name_max}
  validates :description, presence: true,
      length: {maximum: Settings.course.description}
end
