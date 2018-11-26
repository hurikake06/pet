# frozen_string_literal: true

class Cg::DmGroup < ApplicationRecord
  has_many :cg_dms, class_name: 'Cg::Dm'
  belongs_to :cg_info, foreign_key: :dm_group_type_info, primary_key: :id, class_name: 'Cg::Info'
end
