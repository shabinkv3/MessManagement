class CreateExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :extras do |t|
      t.integer :mess_id
      t.date :date
      t.string :rollno
      t.string :item
      t.integer :price

      t.timestamps
    end
  end
end
