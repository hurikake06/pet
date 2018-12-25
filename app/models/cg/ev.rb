# frozen_string_literal: true

class Cg::Ev < ApplicationRecord
  belongs_to :share, class_name: 'Cg::Share'
end
