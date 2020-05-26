class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :rollno
      t.string :password_digest
      t.integer :roomno
      t.integer :mess_id

      t.timestamps
    end
    add_index :students, :email, unique: true
    add_index :students, :rollno, unique: true
  end
end
