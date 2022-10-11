class Api::V1::SubscriptionsController < Api::ApiController
  respond_to :json

  def create
    if params[:plan_id].blank? || current_user.blank?
      render json: {status: 'Failed', message: 'Missing Parameters'}
    else
      @subscription = current_user.subscriptions.new(plan_id: params[:plan_id])
      @subscription.subscription_name = @subscription.plan.plan_name
      if @subscription.save
        render json: {status: 'Successful', subscription: { id: @subscription.id, subscription_name: @subscription.subscription_name, user_id: @subscription.user_id, plan_id: @subscription.plan_id }}
      else
        render json: {status: 'Failed', subscription: @subscription.errors.full_messages}
      end
    end
  end

  def destroy
    if params[:plan_id].blank? || current_user.blank?
      render json: {status: 'Failed', message: 'Missing Parameters'}
    else
      @subscription = current_user.subscriptions.find_by_plan_id(params[:plan_id])
      if @subscription.nil?
        render json: {status: 'Failed', message: 'You do not have any subscription!'}
      else
        @subscription.destroy
        render json: {status: 'Success', message: 'You unsubscribed this plan'}
      end
    end
  end
end
