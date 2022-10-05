class Payment < ApplicationRecord
  belongs_to :user

  def self.total_payment(user_id)
    total = 0
    plans = User.find(user_id).plans.pluck(:plan_id).uniq
    plans.each do |plan|
      plan = Plan.find(plan)
      total += plan.monthly_fee
      plan.features.each do |feature|
        consumed = Subscription.where(user_id: user_id).where(plan_id: plan).where(feature_id:feature.id).first.consumed
        max_units = feature.max_unit_limit
        difference = consumed - max_units
        return  total += difference * Feature.find(feature.id).unit_price if difference > 0
      end
    end
    total
  end
end
