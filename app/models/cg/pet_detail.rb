# frozen_string_literal: true

class Cg::PetDetail < ApplicationRecord
  belongs_to :cg_pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'
  belongs_to :cg_info, foreign_key: :medical_info, primary_key: :id, class_name: 'Cg::Info'

  def host_shares
    Cg::Share.where(pets_id: pets_id)
  end

  def weekdays
    Cg::Info.where(id: Cg::PetsInfo.select(:infos_id).where(pets_id: pets_id), info_types_id: 12)
  end

  def facilities
    Cg::Facility.where(id: Cg::PetsFacility.select(:facilities_id).where(pets_id: pets_id))
  end
end
