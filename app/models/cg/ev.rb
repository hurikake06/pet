# frozen_string_literal: true

class Cg::Ev < ApplicationRecord
  belongs_to :share, class_name: 'Cg::Share'
  belongs_to :info, foreign_key: :ev_info, primary_key: :id, class_name: 'Cg::Info'
end
