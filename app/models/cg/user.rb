# frozen_string_literal: true

class Cg::User < ApplicationRecord
  belongs_to :cg_info, foreign_key: :share_user_info, primary_key: :id, class_name: 'Cg::Info'
  has_many :cg_pets, class_name: 'Cg::Pet'
  has_many :cg_shares, class_name: 'Cg::Share'
  has_one :cg_user_detail, class_name: 'Cg::UserDetail'

  validates :password, length: { minimum: 1}
  validates :username, length: { in: 1..15, message: "15文字以内" }
  validates :username, format: { with: /\A[a-zA1-9\_]+\z/, message: "英数字又は_(アンダースコア)のみ" }

  def pets
    Cg::Pet.where(cg_pets: { users_id: id })
  end
end
