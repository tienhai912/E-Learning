class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.integer :lesson_id
      t.string :content
      t.integer :kind

      t.timestamps
    end
  end
end
