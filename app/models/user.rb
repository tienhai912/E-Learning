class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attr_reader :remember_token, :activation_token, :reset_token

  has_secure_password

  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name:  Relationship.name,
    foreign_key: :following_id, dependent: :destroy
  has_many :following, through: :active_relationships
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :enrollments, class_name: Enroll.name, dependent: :destroy
  has_many :tests, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.user.name_max}
  validates :email, presence: true,
    length: {maximum: Settings.user.email_max},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_nil: true,
    length: {minimum: Settings.user.password_min}

  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end
