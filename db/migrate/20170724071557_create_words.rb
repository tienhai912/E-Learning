class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :content
      t.integer :kind
      t.integer :lesson_id

      t.timestamps
    end

    add_index :words, :lesson_id
    add_foreign_key :words, :lessons
  end
end
