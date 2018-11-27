# frozen_string_literal: true

class Cg::ShareDetail < ApplicationRecord
  belongs_to :share, class_name: 'Cg::Share'
  belongs_to :facility, class_name: 'Cg::Facility'
end
