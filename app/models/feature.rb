class Feature < ApplicationRecord
  validates :feature_name, :code, :unit_price, :max_unit_limit, presence: true

  belongs_to :plan
end
