class CreateCgEvs < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_evs do |t|
      t.bigint :share_id
      t.integer :val
      t.bigint :ev_type_info

      t.timestamps
    end
  end
end