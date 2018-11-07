class CreateCgShares < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_shares do |t|
      t.bigint :users_id
      t.bigint :pets_id
      t.bigint :share_info, default: 1

      t.timestamps
    end
  end
end
