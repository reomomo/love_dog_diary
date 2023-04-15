class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.integer :user_id, null: false
      t.string :diary_date, null: false
      t.string :memo

      t.timestamps
    end
  end
end
