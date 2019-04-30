class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :tradecomments
  has_one :address
  has_many :payments
  has_many :comments
  has_many :sns_credentials, dependent: :destroy
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday_info, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first
    if sns == nil && user == nil
      @user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        password: Devise.friendly_token[0,20]
        )
      @user.save(validate: false)
      @sns = SnsCredential.create(
        user_id: @user.id,
        provider: auth.provider,
        uid: auth.uid
        )
      @user = User.find(@sns.user_id)
    elsif sns == nil && user
      @user = User.find_by(email: auth.info.email)
      @sns = SnsCredential.create(
        user_id: @user.id,
        provider: auth.provider,
        uid: auth.uid
        )
    else
      @user = User.find(sns.user_id)
    end
    @user
  end
end
