# frozen_string_literal: true

class Cg::ShareDetail < ApplicationRecord
  belongs_to :cg_share, foreign_key: :shares_id, primary_key: :id, class_name: 'Cg::Share'
  belongs_to :cg_facility, foreign_key: :facilities_id, primary_key: :id, class_name: 'Cg::Facility'

  def facility
    Cg::Facility.find(:facilities_id)
  end
end
