# frozen_string_literal: true

class CreateCgDms < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_dms do |t|
      t.bigint :dm_groups_id
      t.bigint :users_id
      t.text :content

      t.timestamps
    end
  end
end
