module UsageHelper
  def subscription_feature(plan,feature)
    Subscription.where(plan_id: plan).where(feature_id: feature.id).first
  end
end
