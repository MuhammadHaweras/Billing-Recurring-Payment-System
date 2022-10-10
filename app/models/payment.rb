class Payment < ApplicationRecord
  belongs_to :user

  def self.total_payment(user)
    total = 0
    User.find(user).subscriptions.each do |subscription|
      total += subscription.price
      subscription.plan.feature_plans.each do |feature_plan|
        max_units = feature_plan.feature.max_unit_limit
        get_consumed = subscription.consume_features.find { |consume_feature| consume_feature.feature_id == feature_plan.feature.id }
        get_consumed ? consumed = get_consumed.consume_units : consumed = 0
        difference = consumed - max_units
        total += difference * feature_plan.feature.unit_price if difference > 0
      end
    end
    total
  end
end
