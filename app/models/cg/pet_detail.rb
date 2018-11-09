# frozen_string_literal: true

class Cg::PetDetail < ApplicationRecord
  belongs_to :cg_pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'
  belongs_to :cg_info, foreign_key: :medical_info, primary_key: :id, class_name: 'Cg::Info'
end
