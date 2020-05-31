class CreateMessCuts < ActiveRecord::Migration[6.0]
  def change
    create_table :mess_cuts do |t|
      t.integer :student_id
      t.date :from_date
      t.date :to_date
      t.integer :no_of_days

      t.timestamps
    end
  end
end
