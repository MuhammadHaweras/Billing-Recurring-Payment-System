module SubscriptionsHelper
  def get_consume_feature(consume_features, feature_id)
    consume_features.find { |consume_feature| consume_feature.feature_id == feature_id }
  end

  def due_payment(user)
    user.payments.where(payment: false).pluck(:total_bill).sum
  end
end
