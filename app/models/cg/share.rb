class Cg::Share < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'
  belongs_to :cg_share_state, foreign_key: :share_states_id, primary_key: :id, class_name: 'Cg::ShareState'
end
