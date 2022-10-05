class CreateConsumeUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :consume_units do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
