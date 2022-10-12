class AddPlanReferencesToPayments < ActiveRecord::Migration[6.1]
  def change
    add_reference :payments, :plan, null: true, foreign_key: true
  end
end
