class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :word_id
      t.string :content
      t.boolean :is_correct

      t.timestamps
    end
  end
end
