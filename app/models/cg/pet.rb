# frozen_string_literal: true

class Cg::Pet < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_type, foreign_key: :types_id, primary_key: :id, class_name: 'Cg::Type'
  belongs_to :cg_info, foreign_key: :pets_sex_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :cg_info, foreign_key: :share_pet_info, primary_key: :id, class_name: 'Cg::Info'
  has_many :cg_shares, class_name: 'Cg::Share'
  has_one :cg_pet_detail, class_name: 'Cg::PetDetail'

  validates :users_id, presence: true

  validates :name,
            presence: { message: NO_PRESENCE_MESSAGE },
            length: { in: 1..30, message: '30文字以内にしてください' }

  validates :petname,
            presence: { message: NO_PRESENCE_MESSAGE },
            uniqueness: { message: NO_UNIQUE_MESSAGE },
            length: { in: 1..15, message: '15文字以内' },
            format: {
              with: /\A[a-zA1-9\_]+\z/,
              message: '英数字又は_(アンダースコア)のみ入力してください'
            }

  validates :about,
            length: { maximum: 100, message: '100文字以内' }

  validates :types_id, presence: true

  def type
    Cg::Type.find(types_id)
  end
end
