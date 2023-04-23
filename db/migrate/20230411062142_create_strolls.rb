class CreateStrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :strolls do |t|
      t.integer :user_id, null: false
      t.integer :diary_id, null: false
      t.integer :my_dog_id, null: false
      t.time :start_time
      t.time :end_time
      t.integer :vitality_condition
      t.string :memo

      t.timestamps
    end
  end
end
