class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :subscription_name
      t.references :user
      t.references :plan

      t.timestamps
    end
  end
end
