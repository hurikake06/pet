# frozen_string_literal: true

class Cg::Ev < ApplicationRecord
  belongs_to :cg_share, foreign_key: :shares_id, primary_key: :id, class_name: 'Cg::Share'
  belongs_to :cg_info, foreign_key: :ev_type_info, primary_key: :id, class_name: 'Cg::Info'
end
