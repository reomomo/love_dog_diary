class CreateMyDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :my_dogs do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.integer :size, null: false
      t.date :birthdate
      t.integer :age
      t.integer :human_age
      t.string :image

      t.timestamps
    end
  end
end
