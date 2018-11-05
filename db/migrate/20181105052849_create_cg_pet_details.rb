class CreateCgPetDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pet_details do |t|
      t.bigint :pets_id
      t.bigint :medical_info

      t.timestamps
    end
  end
end
