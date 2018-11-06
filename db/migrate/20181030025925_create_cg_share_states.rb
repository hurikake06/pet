class CreateCgShareStates < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_share_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
