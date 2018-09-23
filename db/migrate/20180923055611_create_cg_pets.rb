class CreateCgPets < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_pets do |t|
      t.bigint :users_id
      t.string :name
      t.string :petname
      t.bigint :types_id
      t.text :about

      t.timestamps
    end
  end
end
