class CreateCgDms < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_dms do |t|
      t.bigint :dm_group_id
      t.bigint :user_id
      t.text :content
      t.bigint :command, default: 0

      t.timestamps
    end
  end
end
