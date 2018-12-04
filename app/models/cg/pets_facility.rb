# frozen_string_literal: true

class Cg::PetsFacility < ApplicationRecord
  belongs_to :pet, class_name: 'Cg::Pet'
  belongs_to :facility, class_name: 'Cg::Facility'
end
