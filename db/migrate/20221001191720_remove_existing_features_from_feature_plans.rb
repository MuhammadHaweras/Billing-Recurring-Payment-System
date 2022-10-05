class RemoveExistingFeaturesFromFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :feature_plans, :existing_features
  end
end
