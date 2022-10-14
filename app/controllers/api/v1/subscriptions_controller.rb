class Api::V1::SubscriptionsController < Api::ApiController

  def create
    @subscription = current_user.subscriptions.new(plan_id: params[:plan_id])
     if @subscription.save
       json_status(:ok, 'You subscribed this plan')
      else
        json_status(:bad_request, 'Invalid plan_id or authorization token')
      end

  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    if @subscription.blank?
      json_status(:bad_request, 'You do not have any subscription')
    else
      @subscription.destroy
      json_status(:ok, 'You Unsubscribed this plan')
    end
  end
end
