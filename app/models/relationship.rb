class Relationship < ApplicationRecord
  belongs_to :following, class_name: User.name
  belongs_to :follower, class_name: User.name

  validates :follower_id, presence: true, numericality: {only_integer: true}
  validates :following_id, presence: true, numericality: {only_integer: true}
  validate :not_follow_self

  private

  def not_follow_self
    errors.add :follower_id, I18n.t("cant_follow_self") if follower_id == following_id
  end
end
