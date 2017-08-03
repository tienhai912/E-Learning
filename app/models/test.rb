class Test < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  has_many :results, dependent: :destroy

  validates :user_id, presence: true, numericality: {only_integer: true}
  validates :lesson_id, presence: true, numericality: {only_integer: true}

  scope :most_recent, ->{order created_at: :desc}
  scope :available, -> user do
    where "user_id IN (?) OR user_id = ?", user.following_ids, user.id
  end
end
