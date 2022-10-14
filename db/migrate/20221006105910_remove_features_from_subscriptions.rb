class RemoveFeaturesFromSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :subscriptions, :feature, index: true, foreign_key: true
  end
end
