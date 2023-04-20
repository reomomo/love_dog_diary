class CreateStrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :strolls do |t|
      t.integer :diary_id, null: false
      t.integer :my_dog_id, null: false
      t.string :road
      t.time :start_time
      t.time :end_time
      t.integer :speed
      t.integer :vitality_condition
      t.string :memo

      t.timestamps
    end
  end
end
