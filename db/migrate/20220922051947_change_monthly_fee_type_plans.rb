class ChangeMonthlyFeeTypePlans < ActiveRecord::Migration[6.1]
  def change
    change_column :plans, :monthly_fee, :string
end
end
