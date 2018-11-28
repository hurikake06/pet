# frozen_string_literal: true

class Cg::UserDmGroup < Cg::DmGroup
    belongs_to :user, class_name: 'Cg::User'
    belongs_to :pet, class_name: 'Cg::Pet'

    def host
      cg_pet.cg_user
    end
end
