class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :user_id, null: false
      t.string :diary_id, null: false
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
