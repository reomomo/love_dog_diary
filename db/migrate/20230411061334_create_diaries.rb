class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.integer :user_id, null: false
      t.integer :my_dog_id, null: false
      t.string :diary_date, null: false
      t.string :memo
      t.integer :appetite
      t.integer :excreta

      t.timestamps
    end
  end
end
