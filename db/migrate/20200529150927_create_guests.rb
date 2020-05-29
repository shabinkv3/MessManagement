class CreateGuests < ActiveRecord::Migration[6.0]
  def change
    create_table :guests do |t|
      t.integer :student_id
      t.text :name
      t.text :rollno
      t.date :date

      t.timestamps
    end
  end
end
