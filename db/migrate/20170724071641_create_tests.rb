class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps
    end

    add_index :tests, :user_id
    add_index :tests, :lesson_id
    add_foreign_key :tests, :users
    add_foreign_key :tests, :lessons
  end
end
