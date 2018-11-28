class CreateCgDmGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_dm_groups do |t|
      t.bigint :user_id
      t.bigint :pet_id
      t.bigint :share_id
      t.bigint :dm_group_type_info

      t.timestamps
    end
  end
end
