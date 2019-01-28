# frozen_string_literal: true

class CreateCgUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_user_details do |t|
      t.bigint :user_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.bigint :document_info, default: 10001
      t.bigint :credit_info, default: 10001
      t.integer :age
      t.bigint :sex_info, default: 10001
      t.bigint :country_info, default: 10001

      t.timestamps
    end
  end
end
