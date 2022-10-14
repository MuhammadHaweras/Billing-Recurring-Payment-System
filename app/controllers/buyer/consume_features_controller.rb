class Buyer::ConsumeFeaturesController < ApplicationController
  def increment_consumed_unit
    @subscription = current_user.subscriptions.find_by(plan_id: params[:plan_id])
    @consume_feature = ConsumeFeature.find_or_create_by(consume_feature_params)
    @consume_feature.increment!(:consume_units)
    respond_to do |format|
      format.js
    end
  end

  private

  def consume_feature_params
    params.require(:consume_feature).permit(:subscription_id, :feature_id, :consume_units)
  end
end
