class ChangePriceTypeSubscriptions < ActiveRecord::Migration[6.1]
  def up
    change_column :subscriptions, :price, :decimal ,using: 'price::decimal'
  end

  def down
    change_column :subscriptions, :price, :string
  end
end
