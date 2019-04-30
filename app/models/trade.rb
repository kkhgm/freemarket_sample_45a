class Trade < ApplicationRecord
  belongs_to :item
  has_many :tradecomments
end
