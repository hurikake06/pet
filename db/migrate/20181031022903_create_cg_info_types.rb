# frozen_string_literal: true

class CreateCgInfoTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :cg_info_types do |t|
      t.string :value

      t.timestamps
    end
  end
end
