class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday_info, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
