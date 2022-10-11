class RemoveMaxUnitLimitFromSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscriptions, :max_unit_limit
  end
end
