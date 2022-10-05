class AddFeatureReferenceToFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    add_reference :feature_plans, :feature, null: false, foreign_key: true
  end
end
