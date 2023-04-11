class CreateDogStrolls < ActiveRecord::Migration[6.1]
  def change
    create_table :dog_strolls do |t|
      t.integer :dog_id, null: false
      t.integer :stroll_id, null: false
      t.timestamps
    end
  end
end
