# frozen_string_literal: true

class Cg::Info < ApplicationRecord
  belongs_to :info_type, class_name: 'Cg::InfoType'
end
