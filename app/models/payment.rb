class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :plan, optional: true

  def self.total_payment(user_id, plan_id)
    total = 0
    plan = User.find(user_id).plans.find(plan_id)
    total = plan.monthly_fee
    plan.features.each do |feature|
      consume_feature = feature.consume_features.find { |consume_feature| consume_feature.feature_id == feature.id }
      difference = consume_feature&.consume_units.to_i - feature.max_unit_limit
      total += difference * feature.unit_price if difference > 0
    end

    total
  end
end
