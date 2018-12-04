# frozen_string_literal: true

class CreateCgPetsFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets_facilities do |t|
      t.bigint :pet_id
      t.bigint :facility_id

      t.timestamps
      t.index %i[pet_id facility_id], unique: true
    end
  end
end
