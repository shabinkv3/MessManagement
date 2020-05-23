class CreateTestings < ActiveRecord::Migration[6.0]
  def change
    create_table :testings do |t|
      t.text :name
      t.integer :rollno

      t.timestamps
    end
  end
end
