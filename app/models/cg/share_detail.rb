class Cg::ShareDetail < ApplicationRecord
  belongs_to :cg_share, foreign_key: :shares_id, primary_key: :id, class_name: 'Cg::Share'
end
