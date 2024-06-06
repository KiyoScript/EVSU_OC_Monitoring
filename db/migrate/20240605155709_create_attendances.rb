class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.string :name
      t.datetime :time_in
      t.datetime :time_out
      t.date :date
      t.references :attendable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
