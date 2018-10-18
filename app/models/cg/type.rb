# frozen_string_literal: true

class Cg::Type < ApplicationRecord
  has_many :cg_pets, foreign_key: :types_id, primary_key: :id, class_name: 'Cg::Pet'
end
