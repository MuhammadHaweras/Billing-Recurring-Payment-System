class Remove < ActiveRecord::Migration[6.1]
  def change
    remove_column :features, :plan_id
  end
end
