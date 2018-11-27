# frozen_string_literal: true

class Cg::UserDmGroup < Cg::DmGroup
    belongs_to :user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
    belongs_to :pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'
end
