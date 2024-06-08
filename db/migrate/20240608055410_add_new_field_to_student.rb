class AddNewFieldToStudent < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :guardian_email, :string
  end
end
