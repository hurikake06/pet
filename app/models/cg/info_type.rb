# frozen_string_literal: true

class Cg::InfoType < ApplicationRecord
  has_many :infos, class_name: 'Cg::Info'
end
