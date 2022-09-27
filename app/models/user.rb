class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = [:admin, :buyer]

  enum role: ROLES

  has_many :subscriptions
  has_many :plans, through: :subscriptions
end
