class Buyer::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: :increment_consumed_unit

  def index
    @subscriptions = Subscription.all
    @bill = Payment.where(user_id: current_user.id).last
  end

  def increment_consumed_unit
    @subscription.increment!(:consumed)
    redirect_to buyer_subscriptions_path, notice: 'Unit consumed for this subscription!'
  end

  def create
    plan = Plan.find(subscription_params[:plan_id])
    plan.features.each do |feature|
      @subscription = Subscription.create!(subscription_params.merge(feature_id: feature.id))
    end
    redirect_to buyer_subscriptions_path
  end

  def destroy
    @subscriptions = Subscription.where(user_id: current_user.id).where(plan_id: params[:id])
    @subscriptions.destroy_all
    redirect_to buyer_plans_path
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:subscription_name, :price, :consumed, :user_id, :plan_id, :feature_id)
  end
end
