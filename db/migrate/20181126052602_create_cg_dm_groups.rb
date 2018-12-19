class CreateCgDmGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_dm_groups do |t|
      t.string :type
      t.bigint :user_id
      t.bigint :pet_id
      t.bigint :share_id

      t.timestamps
      t.index %i[user_id pet_id], unique: true
      t.index :share_id, unique: true
    end
  end
end
