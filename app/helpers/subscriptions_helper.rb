module SubscriptionsHelper
   def user_plan
     @subscriptions.where(user_id: current_user.id).pluck(:plan_id).uniq
   end

  def user_subscriptions(plan,feature)
    Subscription.where(user_id: current_user.id).where(plan_id: plan)
                                                .where(feature_id: feature.id).first
  end
end
