class CreateStaffs < ActiveRecord::Migration[6.0]
  def change
    create_table :staffs do |t|
      t.text :name
      t.text :phoneno
      t.integer :mess_id

      t.timestamps
    end
  end
end
