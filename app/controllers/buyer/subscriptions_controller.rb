class Buyer::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: :destroy

  def index
    @subscriptions = current_user.subscriptions.includes(:consume_features, plan: [feature_plans: [:feature]])
    @bill = current_user.payments.last
  end

  def create
    @subscription = Subscription.create!(subscription_params)
    redirect_to buyer_subscriptions_path, notice: 'Plan subscribed successfully!'
  end

  def destroy
    @subscription.destroy
    redirect_to buyer_plans_path, notice: 'Plan successfully unsubscribed.'
  end

  private

  def set_subscription
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:subscription_name, :price, :user_id, :plan_id)
  end
end
