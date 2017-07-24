class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :test_id
      t.integer :word_id
      t.integer :answer_id

      t.timestamps
    end

    add_index :results, :test_id
    add_index :results, :word_id
    add_index :results, :answer_id
    add_foreign_key :results, :tests
    add_foreign_key :results, :words
    add_foreign_key :results, :answers
  end
end
