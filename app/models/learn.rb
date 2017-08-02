class Learn < ApplicationRecord
  belongs_to :user, :word

  scope :leanred, ->{where has_learn: true}
  scope :not_leanred, ->{where has_learn: false}
end
