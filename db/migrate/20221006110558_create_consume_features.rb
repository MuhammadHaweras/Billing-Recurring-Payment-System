class CreateConsumeFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :consume_features do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true
      t.integer :consume_units

      t.timestamps
    end
  end
end
