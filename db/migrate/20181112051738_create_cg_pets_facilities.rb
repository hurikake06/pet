class CreateCgPetsFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets_facilities do |t|
      t.bigint :pets_id
      t.bigint :facilities_id

      t.timestamps
    end
  end
end
