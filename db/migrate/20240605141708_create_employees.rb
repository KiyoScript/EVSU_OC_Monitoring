class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :employee_id
      t.string :rfid
      t.string :last_name
      t.string :given_name
      t.string :middle_name
      t.integer :gender
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
