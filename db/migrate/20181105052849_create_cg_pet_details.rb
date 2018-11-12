class CreateCgPetDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pet_details do |t|
      t.bigint :pets_id
      t.bigint :medical_info, default: 100
      t.integer :fixed_cost
      t.integer :variable_cost

      t.timestamps
    end
  end
end
