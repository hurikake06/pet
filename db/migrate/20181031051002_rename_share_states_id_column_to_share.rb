class RenameShareStatesIdColumnToShare < ActiveRecord::Migration[5.2]
  def change
    rename_column :cg_shares, :share_states_id, :share_info
  end
end
