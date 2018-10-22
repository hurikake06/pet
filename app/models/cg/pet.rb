# frozen_string_literal: true

class Cg::Pet < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_type, foreign_key: :types_id, primary_key: :id, class_name: 'Cg::Type'

  def type
    Cg::Type.find(types_id)
  end
end
