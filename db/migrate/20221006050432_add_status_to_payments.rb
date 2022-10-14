class AddStatusToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :payment, :boolean, default: false
  end
end
