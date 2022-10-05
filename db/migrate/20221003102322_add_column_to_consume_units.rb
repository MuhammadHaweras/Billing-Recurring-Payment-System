class AddColumnToConsumeUnits < ActiveRecord::Migration[6.1]
  def change
    add_column :consume_units, :unit_consumed, :integer, default: 0
  end
end
