class CreateCgPets < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets do |t|
      t.bigint :users_id
      t.string :name
      t.string :petname
      t.bigint :pets_sex_info
      t.bigint :types_id
      t.text :about
      t.bigint :share_pet_info

      t.timestamps
    end
  end
end
