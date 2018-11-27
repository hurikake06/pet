# frozen_string_literal: true

class CreateCgDmGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_dm_groups do |t|
      t.bigint :users_id
      t.bigint :pets_id
      t.bigint :shares_id
      t.bigint :dm_group_type_info

      t.timestamps
    end
  end
end
