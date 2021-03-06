# frozen_string_literal: true

class CreateCgShares < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_shares do |t|
      t.bigint :user_id
      t.bigint :pet_id
      t.bigint :share_info, default: 101

      t.timestamps
    end
  end
end
