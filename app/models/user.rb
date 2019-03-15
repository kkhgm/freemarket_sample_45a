class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address
  has_many :sns_credentials
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday_info, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first
    unless sns
      @user = User.new(
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
        )
      # @user.save(validate: false)
      ssns = SnsCredential.new(
        provider: auth.provider,
        uid: auth.uid
        )
    end
    @user
  end
end
