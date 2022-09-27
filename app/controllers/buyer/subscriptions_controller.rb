class Buyer::SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
  end
  def create
    @subscription = Subscription.create(subscription_params)

    if @subscription.save
      redirect_to buyer_subscriptions_path
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to buyer_plans_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:subscription_name, :price, :user_id, :plan_id)
  end
end
