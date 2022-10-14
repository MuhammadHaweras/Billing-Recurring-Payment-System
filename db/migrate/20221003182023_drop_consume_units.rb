class DropConsumeUnits < ActiveRecord::Migration[6.1]
  def change
    drop_table :consume_units
  end
end
