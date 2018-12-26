class CreateCgEvs < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_evs do |t|
      t.string :type
      t.bigint :share_id
      t.bigint :ev_info, default: 39
      t.integer :val

      t.timestamps
      t.index %i[share_id type], unique: true
    end
  end
end
