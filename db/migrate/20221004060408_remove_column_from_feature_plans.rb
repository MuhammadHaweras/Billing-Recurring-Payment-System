class RemoveColumnFromFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    remove_column :feature_plans, :allocated_units
  end
end
