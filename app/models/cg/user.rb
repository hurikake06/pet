# frozen_string_literal: true

class Cg::User < ApplicationRecord
  has_many :cg_pets, class_name: 'Cg::Pet'

  def users_pets
    Cg::Pet.where(cg_pets: { users_id: id })
  end
end
