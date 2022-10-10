module SubscriptionsHelper
  def get_consume_feature(consume_features, feature_id)
    consume_features.find { |consume_feature| consume_feature.feature_id == feature_id }
  end
end
