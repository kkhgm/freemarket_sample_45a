class Tradecomment < ApplicationRecord
  belongs_to :trade
  belongs_to :user
  validates :comment, presence: true
end
