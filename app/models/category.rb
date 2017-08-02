class Category < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :lessons, through: :courses
  has_many :words, through: :lessons

  validates :name, presence: true,
    length: {maximum: Settings.category.name_max}
  validates :description, presence: true,
    length: {maximum: Settings.category.description}
end
