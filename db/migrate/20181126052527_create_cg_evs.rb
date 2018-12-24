class CreateCgEvs < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_evs do |t|
      t.bigint :share_id
      t.integer :val
      t.bigint :ev_type_info

      t.timestamps
      t.index %i[share_id ev_type_info], unique: true
    end
  end
end
