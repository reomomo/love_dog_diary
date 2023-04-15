class CreateDogDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_diaries do |t|
      t.integer :my_dog_id, null: false
      t.integer :diary_id, null: false
      t.integer :appetite
      t.integer :excreta
      t.integer :age
      t.integer :human_age

      t.timestamps
    end
  end
end
