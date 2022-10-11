class Buyer::ConsumeFeaturesController < ApplicationController

  def increment_consumed_unit
    @consume_unit = ConsumeFeature.find_or_create_by(consume_feature_params)
    @consume_unit.increment!(:consume_units)
    respond_to do |format|
      format.js
    end
  end

  private

  def consume_feature_params
    params.require(:cosume_feature).permit(:subscription_id, :feature_id, :consume_units)
  end
end
