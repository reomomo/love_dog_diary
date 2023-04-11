class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :user_id, null: false
      t.string :name, null: false
      t.integer :dog_type, null: false
      t.date :birthdate

      t.timestamps
    end
  end
end
