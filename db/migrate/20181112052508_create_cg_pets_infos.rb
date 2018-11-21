# frozen_string_literal: true

class CreateCgPetsInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets_infos do |t|
      t.bigint :pets_id
      t.bigint :infos_id

      t.timestamps
    end
  end
end
