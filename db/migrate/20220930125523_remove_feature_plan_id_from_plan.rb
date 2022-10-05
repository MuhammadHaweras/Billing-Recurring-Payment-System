class RemoveFeaturePlanIdFromPlan < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :feature_plan_id
  end
end
