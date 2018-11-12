# frozen_string_literal: true

class Cg::Share < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'

  def user
    Cg::User.find(users_id)
  end

  def pet
    Cg::Pet.find(pets_id)
  end

  def info
    Cg::Info.find(share_info)
  end
end
