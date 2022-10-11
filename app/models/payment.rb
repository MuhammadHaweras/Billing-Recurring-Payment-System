class Payment < ApplicationRecord
  belongs_to :user

  def self.total_payment(id)
    total = 0
    User.find(id).plans.each do |plan|
      total += plan.monthly_fee
      plan.features.each do |feature|
        consume_feature = feature.consume_features.find { |consume_feature| consume_feature.feature_id == feature.id }
        difference = consume_feature&.consume_units.to_i - feature.max_unit_limit
        total += difference * feature.unit_price if difference > 0
      end
    end

    total
  end
end
