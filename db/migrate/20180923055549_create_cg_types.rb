class CreateCgTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_types do |t|
      t.string :name
      t.bigint :share_type_info, default:22

      t.timestamps
    end
  end
end
