# frozen_string_literal: true

class Cg::User < ApplicationRecord
  has_many :cg_pets, class_name: 'Cg::Pet'
  has_many :cg_shares, class_name: 'Cg::Share'

  validates :password, length: { minimum: 1}
  validates :username, length: { in: 1..15, message: "15文字以内" }
  validates :username, format: { with: /\A[a-zA1-9\_]+\z/, message: "英数字又は_(アンダースコア)のみ"}

  def pets
    Cg::Pet.where(cg_pets: { users_id: id })
  end
end
