class Address < ApplicationRecord
  belongs_to :user
  validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture, :city, :street, presence: true
end
