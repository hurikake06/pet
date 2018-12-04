# frozen_string_literal: true

class CreateCgPetsInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets_infos do |t|
      t.bigint :pet_id
      t.bigint :info_id

      t.timestamps
    end
  end
end
