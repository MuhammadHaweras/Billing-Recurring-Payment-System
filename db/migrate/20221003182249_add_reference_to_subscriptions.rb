class AddReferenceToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :subscriptions, :feature, null: false, foreign_key: true
  end
end
