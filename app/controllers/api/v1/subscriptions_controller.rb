class Api::V1::SubscriptionsController < Api::ApiController

  def create
    if params[:plan_id].blank? || current_user.blank?
      render json: {status: 'Failed', message: 'Missing Parameters'}
    else
      @subscription = current_user.subscriptions.new(plan_id: params[:plan_id])
      @subscription.subscription_name = @subscription.plan.plan_name
      if @subscription.save
        render json: {status: :ok, subscription: { id: @subscription.id, subscription_name: @subscription.subscription_name, user_id: @subscription.user_id, plan_id: @subscription.plan_id }}
      else
        render json: {status: :bad_request, subscription: @subscription.errors.full_messages}
      end
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    if @subscription.nil?
      render json: {status: :bad_request, message: 'You do not have any subscription!'}
    else
      @subscription.destroy
      render json: {status: :ok, message: 'You unsubscribed this plan'}
    end
  end
end
