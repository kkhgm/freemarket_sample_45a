class Trade < ApplicationRecord
  belongs_to :item, optional: true
end
