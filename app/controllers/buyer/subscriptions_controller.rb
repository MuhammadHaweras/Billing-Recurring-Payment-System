class Buyer::SubscriptionsController < ApplicationController

  def index
    @subscriptions = Subscription.all
  end
  def create
    @subscription = Subscription.create!(subscription_params)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:subscription_name, :user_id, :plan_id)
  end
end
