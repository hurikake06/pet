class CreateCgPetsFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets_facilities do |t|
      t.bigint :pets_id
      t.bigint :facilities_id

      t.timestamps
      t.index [:pets_id, :facilities_id], unique: true
    end
  end
end
