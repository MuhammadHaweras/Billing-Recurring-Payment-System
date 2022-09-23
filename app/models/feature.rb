class Feature < ApplicationRecord
  belongs_to :plan

  validates :feature_name, :code, :unit_price, :max_unit_limit, presence: true	
end
