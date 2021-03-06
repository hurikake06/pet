# frozen_string_literal: true

class CreateCgShareDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_share_details do |t|
      t.bigint :share_id
      t.bigint :facility_id
      t.datetime :start
      t.datetime :end
      t.datetime :actually_start
      t.datetime :actually_end
      t.integer :fixed_cost
      t.integer :variable_cost

      t.timestamps
    end
  end
end
