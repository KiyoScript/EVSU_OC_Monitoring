class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :rfid
      t.string :last_name
      t.string :given_name
      t.string :middle_name
      t.string :program
      t.integer :gender

      t.timestamps
    end
  end
end
