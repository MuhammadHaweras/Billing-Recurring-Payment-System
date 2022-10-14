class AddColumnToFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    add_column :feature_plans, :unit_consumed, :integer, default: 0
  end
end
