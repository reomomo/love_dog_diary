class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.integer :user_id, null: false
      t.integer :diary_id, null: false
      t.integer :my_dog_id, null: false
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
