# frozen_string_literal: true

class Cg::PetsInfo < ApplicationRecord
  belongs_to :pet, class_name: 'Cg::Pet'
  belongs_to :info, class_name: 'Cg::Info'
end
