class CreateCgDmGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_dm_groups do |t|
      t.string :type
      t.bigint :users_id
      t.bigint :pets_id
      t.bigint :shares_id

      t.timestamps
    end
  end
end