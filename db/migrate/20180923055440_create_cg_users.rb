class CreateCgUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.text :about
      t.bigint :share_user_info
      t.bigint :share_host_info

      t.timestamps
    end
  end
end
