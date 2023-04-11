class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :user_id, null: false
      t.date :diary_date, null: false
      t.string :memo
      t.integer :appetite
      t.integer :excreta
      t.integer :age
      t.integer :human_age

      t.timestamps
    end
  end
end
