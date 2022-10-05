module UsageHelper
  def subscription_feature(user, plan,feature)
    Subscription.where(user_id: user).where(plan_id: plan).where(feature_id: feature).first
  end
end
