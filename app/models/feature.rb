class Feature < ApplicationRecord
  validates :feature_name, :code, :unit_price, :max_unit_limit, presence: true

  has_many :feature_plans, dependent: :destroy
  has_many :plans, through: :feature_plans
  has_many :consume_features
end
