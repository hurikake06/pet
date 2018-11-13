# frozen_string_literal: true

class Cg::PetsFacility < ApplicationRecord
  belongs_to :cg_pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'
  belongs_to :cg_facility, foreign_key: :facilities_id, primary_key: :id, class_name: 'Cg::Facility'
end
