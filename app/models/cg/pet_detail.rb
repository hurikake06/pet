# frozen_string_literal: true

class Cg::PetDetail < ApplicationRecord
  belongs_to :pet, class_name: 'Cg::Pet'
  belongs_to :medical, foreign_key: :medical_info, primary_key: :id, class_name: 'Cg::Info'

  validates :variable_cost,
            numericality: {
              allow_blank: true,
              greater_than_or_equal_to: 0
            },
            on: :update

  validates :fixed_cost,
            numericality: {
              allow_blank: true,
              greater_than_or_equal_to: 0
            },
            on: :update

  validates :share_about,
            length: { maximum: 100, message: '100文字以内' }

  def weekdays
    Cg::Info.where(id: Cg::PetsInfo.select(:info_id).where(pet_id: pet_id), info_types_id: 12)
  end

  def facilities
    Cg::Facility.where(id: Cg::PetsFacility.select(:facilities_id).where(pet_id: pet_id))
  end
end
