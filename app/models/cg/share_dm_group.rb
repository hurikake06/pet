# frozen_string_literal: true

class Cg::ShareDmGroup < Cg::DmGroup
  belongs_to :share, foreign_key: :shares_id, primary_key: :id, class_name: 'Cg::Share'
end
