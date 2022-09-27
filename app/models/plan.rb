class Plan < ApplicationRecord
  validates :plan_name, :monthly_fee, presence: true

  has_many :features, dependent: :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
