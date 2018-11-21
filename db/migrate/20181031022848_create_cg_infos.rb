# frozen_string_literal: true

class CreateCgInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_infos do |t|
      t.bigint :info_types_id
      t.string :value

      t.timestamps
    end
  end
end
