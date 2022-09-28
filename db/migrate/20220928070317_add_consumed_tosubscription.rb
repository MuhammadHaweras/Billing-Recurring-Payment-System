class AddConsumedTosubscription < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :consumed, :integer, default: 0
  end
end
