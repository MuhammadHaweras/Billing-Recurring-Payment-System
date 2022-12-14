class CreateFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :feature_name
      t.string :code
      t.integer :unit_price
      t.integer :max_unit_limit

      t.timestamps
    end
  end
end
