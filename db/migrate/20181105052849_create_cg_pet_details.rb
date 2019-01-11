# frozen_string_literal: true

class CreateCgPetDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pet_details do |t|
      t.bigint :pet_id
      t.bigint :medical_info, default: 10001
      t.integer :fixed_cost
      t.integer :variable_cost
      t.text :share_about

      t.timestamps
    end
  end
end
