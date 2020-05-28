class ChangeMessIdToBeIntegerInExtra < ActiveRecord::Migration[6.0]
  def change
    change_column :extra, :mess_id, :integer
  end
end
