class Plan < ApplicationRecord
  validates :plan_name, :monthly_fee, presence: true

  has_many :feature_plans, dependent: :destroy
  has_many :features, through: :feature_plans
  accepts_nested_attributes_for :feature_plans, reject_if: :all_blank, allow_destroy: true
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
