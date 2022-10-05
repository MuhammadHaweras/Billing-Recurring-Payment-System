class ChangeFeatureIdNullinFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    change_column_null :feature_plans, :feature_id, true
  end
end
