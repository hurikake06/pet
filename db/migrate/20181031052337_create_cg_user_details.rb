class CreateCgUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_user_details do |t|
      t.bigint :users_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.bigint :document_info
      t.bigint :credit_info
      t.integer :age
      t.bigint :sex_info
      t.bigint :country_info

      t.timestamps
    end
  end
end
