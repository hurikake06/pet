# frozen_string_literal: true

class Cg::User < ApplicationRecord
  has_many :cg_pets, class_name: 'Cg::Pet'
end
