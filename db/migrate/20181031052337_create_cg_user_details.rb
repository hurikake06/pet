class CreateCgUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_user_details do |t|
      t.bigint :users_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.bigint :document_info, default: 100
      t.bigint :credit_info, default: 100
      t.integer :age
      t.bigint :sex_info, default: 100
      t.bigint :country_info, default: 100

      t.timestamps
    end
  end
end
