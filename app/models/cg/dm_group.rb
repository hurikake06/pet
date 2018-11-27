# frozen_string_literal: true

class Cg::DmGroup < ApplicationRecord
  has_many :cg_dms, class_name: 'Cg::Dm'
end
