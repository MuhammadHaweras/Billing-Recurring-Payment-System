class AddExistingFeaturesToFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    add_column :feature_plans, :existing_features, :string
  end
end
