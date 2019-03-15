class SnsCredential < ApplicationRecord
  belongs_to :user
  validates :provider, :uid, uniqueness: true
end
