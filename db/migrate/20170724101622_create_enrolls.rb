class CreateEnrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :enrolls do |t|
      t.integer :user_id
      t.integer :course_id
      t.integer :status
      t.datetime :date_start
      t.datetime :date_finish

      t.timestamps
    end
  end
end
