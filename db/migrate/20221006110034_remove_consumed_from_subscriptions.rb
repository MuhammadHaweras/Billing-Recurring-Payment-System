class RemoveConsumedFromSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_column :subscriptions, :consumed
  end
end