# frozen_string_literal: true

class CreateCgPets < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets do |t|
      t.bigint :user_id
      t.string :name
      t.string :petname
      t.bigint :pets_sex_info, default: 10001
      t.bigint :type_id
      t.string :icon
      t.text :about
      t.bigint :share_pet_info, default: 601

      t.timestamps
    end
  end
end
