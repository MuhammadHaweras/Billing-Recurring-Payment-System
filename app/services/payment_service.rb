class PaymentService
  attr_accessor :plan, :user

  def initialize(plan_id, user_id)
    @user = User.find_by(id: user_id)
    @plan =  user.plans.find_by(id: plan_id)
  end

  def call
    total = plan.monthly_fee
    plan.features.each do |feature|
      consume_feature = feature.consume_features.find { |consume_feature| consume_feature.subscription_id == current_subscribtion_id }
      total += total(consume_feature, feature)
    end

    total
  end

  def current_subscribtion_id
    @subscribtion_id ||= user.subscriptions.find_by(plan_id: plan.id).id
  end

  def total(consume_feature, feature)
    excessive_used_units = consume_feature&.consume_units.to_i - feature.max_unit_limit
    return 0 if excessive_used_units <= 0

    excessive_used_units * feature.unit_price
  end
end
