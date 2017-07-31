class Enroll < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :course_id, presence: true, numericality: {only_integer: true}
  validates :status, presence: true
  validates :date_start, presence: true
  validates :date_finish, presence: true, allow_nil: true
  validate :finish_after_start

  enum status: %i(not_finish finished)

  private

  def finish_after_start
    return unless date_start.present? && date_finish.present? && date_start > date_finish
    errors.add :date_finish, I18n.t("cant_finish_before_start")
  end
end
