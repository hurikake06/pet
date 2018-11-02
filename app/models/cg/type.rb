# frozen_string_literal: true

class Cg::Type < ApplicationRecord
  has_many :cg_pets, foreign_key: :types_id, primary_key: :id, class_name: 'Cg::Pet'
  belongs_to :cg_info, foreign_key: :share_type_info, primary_key: :id, class_name: 'Cg::Info'
end
