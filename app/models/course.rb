class Course < ApplicationRecord
  attr_reader :enroll

  belongs_to :category

  has_many :lessons, dependent: :destroy
  has_many :enrolls, dependent: :destroy
  has_many :tests, through: :lessons, foreign_key: :lesson_id

  validates :category_id, presence: true, numericality: {only_integer: true}
  validates :name, presence: true,
      length: {maximum: Settings.course.name_max}
  validates :description, presence: true,
      length: {maximum: Settings.course.description}

  def has_enrolled? user
    find_enroll(user).present?
  end

  def has_finished? user
    return unless has_enrolled? user
    enroll.finished?
  end

  private

  def find_enroll user
    @enroll ||= enrolls.find_by user: user
  end
end
