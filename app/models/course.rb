class Course < ApplicationRecord
  belongs_to :category

  has_many :lessons, dependent: :destroy

  validates :category_id, presence: true, numericality: {only_integer: true}
  validates :name, presence: true,
      length: {maximum: Settings.course.name_max}
  validates :description, presence: true,
      length: {maximum: Settings.course.description}

  def has_enrolled? user
    Enroll.where("user_id = ? AND course_id = ?", user.id, id).present?
  end

  def has_finished? user
    return unless has_enrolled? user
    Enroll.find_by(user_id: user.id, course_id: id).status == 2
  end
end
