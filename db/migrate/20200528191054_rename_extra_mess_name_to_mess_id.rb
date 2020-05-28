class RenameExtraMessNameToMessId < ActiveRecord::Migration[6.0]
  def change
    rename_column :extras, :mess_name, :mess_id
  end
end
