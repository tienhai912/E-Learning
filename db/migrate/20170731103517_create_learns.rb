class CreateLearns < ActiveRecord::Migration[5.1]
  def change
    create_table :learns do |t|
      t.integer :user_id
      t.integer :word_id
      t.boolean :has_learned

      t.timestamps
    end
  end
end
