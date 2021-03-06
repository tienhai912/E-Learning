class Category < ApplicationRecord
  has_many :courses, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.category.name_max}
  validates :description, presence: true,
    length: {maximum: Settings.category.description}
end
