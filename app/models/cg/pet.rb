# frozen_string_literal: true

class Cg::Pet < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_type, foreign_key: :types_id, primary_key: :id, class_name: 'Cg::Type'

  def self.join_type
    self.joins(:cg_type).select('cg_pets.*,cg_types.name as types_name')
  end

  def self.get_users_pets users_id
    self.where(cg_pets: { users_id: users_id })
  end
end
