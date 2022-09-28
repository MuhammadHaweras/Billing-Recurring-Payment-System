class Buyer::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[increment_consumed_unit destroy]

  def index
    @subscriptions = Subscription.all
  end

  def increment_consumed_unit
    @subscription.update_attribute(:consumed, @subscription.consumed+1)
    redirect_to buyer_subscriptions_path, notice: 'Unit consuemed for this subscription!'
  end

  def create
    @subscription = Subscription.create(subscription_params)

    if @subscription.save
      redirect_to buyer_subscriptions_path
    end
  end

  def destroy
    @subscription.destroy
    redirect_to buyer_plans_path, notice: 'Plan Unsubsucribed!'
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:subscription_name, :price, :consumed, :user_id, :plan_id)
  end
end
