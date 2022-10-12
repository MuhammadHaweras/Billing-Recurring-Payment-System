class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, validate_on_invite: true

  validates :avatar, attached: true,
                        content_type: %i[png jpg jpeg],
                        size: { less_than: 2.megabytes , message: 'must be less than 2MB in size' }

  ROLES = [:admin, :buyer]

  enum role: ROLES

  has_one_attached :avatar

  has_many :subscriptions
  has_many :payments
  has_many :plans, through: :subscriptions

  def generate_auth_token!
    begin
     self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
