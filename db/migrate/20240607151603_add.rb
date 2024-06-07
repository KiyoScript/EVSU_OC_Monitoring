class Add < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :email, :string, null: false
    add_column :employees, :email, :string, null: false
  end
end
