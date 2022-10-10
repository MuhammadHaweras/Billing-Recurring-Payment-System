class ChangeConsumeUnits < ActiveRecord::Migration[6.1]
  def change
    change_column :consume_features, :consume_units, :integer, default: 0
  end
end
