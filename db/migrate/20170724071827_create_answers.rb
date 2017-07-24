class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :content
      t.boolean :is_correct
      t.integer :word_id

      t.timestamps
    end

    add_index :answers, :word_id
    add_foreign_key :answers, :words
  end
end
