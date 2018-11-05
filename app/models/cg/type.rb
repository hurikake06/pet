# frozen_string_literal: true

class Cg::Type < ApplicationRecord
  belongs_to :cg_info, foreign_key: :share_type_info, primary_key: :id, class_name: 'Cg::Info'
  has_many :cg_pets, foreign_key: :types_id, primary_key: :id, class_name: 'Cg::Pet'
end
