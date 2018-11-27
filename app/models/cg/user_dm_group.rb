# frozen_string_literal: true

class Cg::UserDmGroup < Cg::DmGroup
    belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
    belongs_to :cg_pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'

    def host
      cg_pet.cg_user
    end
end
