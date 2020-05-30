class CreateExtras < ActiveRecord::Migration[6.0]
  def change
    create_table :extras do |t|
      t.integer :student_id
      t.string :item
      t.integer :price

      t.timestamps
    end
  end
end
