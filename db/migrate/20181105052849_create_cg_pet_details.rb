class CreateCgPetDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pet_details do |t|
      t.bigint :pets_id
      t.bigint :medical_info, default: 100
      t.int :fixed_cost
      t.int :variable_cost

      t.timestamps
    end
  end
end
