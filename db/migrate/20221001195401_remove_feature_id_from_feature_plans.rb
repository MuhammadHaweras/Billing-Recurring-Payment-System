class RemoveFeatureIdFromFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :feature_plans, :feature_id
  end
end
