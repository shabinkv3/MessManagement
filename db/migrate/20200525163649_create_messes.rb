class CreateMesses < ActiveRecord::Migration[6.0]
  def change
    create_table :messes do |t|
      t.string :mess_name
      t.string :password_digest

      t.timestamps
    end
  end
end
