class CreateCgUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.text :about
      t.bigint :share_user_info, default: 12
      t.bigint :share_host_info, default: 14

      t.timestamps
    end
  end
end
