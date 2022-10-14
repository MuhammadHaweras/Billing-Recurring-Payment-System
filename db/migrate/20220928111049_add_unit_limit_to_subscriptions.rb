class AddUnitLimitToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :max_unit_limit, :integer
  end
end
