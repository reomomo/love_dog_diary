class CreatePins < ActiveRecord::Migration[6.1]
  def change
    create_table :pins do |t|
      t.integer :stroll_id, null: false
      t.decimal :latitude, null: false, precision: 10, scale: 6
      t.decimal :longitude, null: false, precision: 10, scale: 6
      t.integer :distance, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
