class ChangePlanMonthlyFeeType < ActiveRecord::Migration[6.1]
  def up
    change_column :plans, :monthly_fee, :decimal ,using: 'monthly_fee::decimal'
  end

  def down
    change_column :plans, :monthly_fee, :string
  end
end
