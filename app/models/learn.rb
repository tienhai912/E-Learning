class Learn < ApplicationRecord
  belongs_to :user
  belongs_to :word

  scope :user_learn, ->(user_id){where user_id: user_id}
end
