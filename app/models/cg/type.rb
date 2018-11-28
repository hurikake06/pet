# frozen_string_literal: true

class Cg::Type < ApplicationRecord
  belongs_to :share_type, foreign_key: :share_type_info, primary_key: :id, class_name: 'Cg::Info'
  has_many :pets, class_name: 'Cg::Pet'
end
