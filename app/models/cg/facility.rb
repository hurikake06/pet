# frozen_string_literal: true

class Cg::Facility < ApplicationRecord
  has_many :cg_pets_facilities, class_name: 'Cg::PetsFacility'
  has_many :cg_pets, class_name: 'Cg::Pet', through: :cg_pets_facilities
  has_many :cg_share_details, class_name: 'Cg::ShareDetail'

  def pets
    Cg::Pet.where(id: Cg::PetsFacility.select(:pets_id).where(facilities_id: id))
  end
end
