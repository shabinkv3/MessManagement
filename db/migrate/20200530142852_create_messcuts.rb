class CreateMesscuts < ActiveRecord::Migration[6.0]
  def change
    create_table :messcuts do |t|
      t.date :fromdate
      t.date :todate
      t.integer :no_of_days
      t.integer :student_id

      t.timestamps
    end
  end
end
