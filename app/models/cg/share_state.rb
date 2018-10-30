class Cg::ShareState < ApplicationRecord
  has_many :cg_shares, foreign_key: :share_states_id, primary_key: :id, class_name: 'Cg::Share'
end
