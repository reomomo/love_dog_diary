class CreateStrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :strolls do |t|
      t.string :diary_id, null: false
      t.string :road
      t.time :start_time
      t.time :end_time
      t.integer :distance
      t.integer :speed
      t.string :vitality_condition
      t.string :memo

      t.timestamps
    end
  end
end
