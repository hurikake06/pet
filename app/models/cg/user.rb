# frozen_string_literal: true

class Cg::User < ApplicationRecord
  belongs_to :cg_info, foreign_key: :share_user_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :cg_info, foreign_key: :share_host_info, primary_key: :id, class_name: 'Cg::Info'
  has_one :cg_user_detail, class_name: 'Cg::UserDetail', foreign_key: :users_id, inverse_of: :cg_user
  has_many :cg_pets, class_name: 'Cg::Pet'
  has_many :cg_shares, class_name: 'Cg::Share'
  has_many :cg_dms, class_name: 'Cg::Dm'
  accepts_nested_attributes_for :cg_user_detail

  validates :name,
            presence: { message: NO_PRESENCE_MESSAGE },
            length: { in: 1..30, message: '30文字以内にしてください' }

  validates :email,
            presence: { message: NO_PRESENCE_MESSAGE },
            uniqueness: { message: NO_UNIQUE_MESSAGE },
            format: {
              with: /\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-]+)*\z/,
              message: '正しいメールアドレスを入力してください'
            }

  validates :username,
            presence: { message: NO_PRESENCE_MESSAGE },
            uniqueness: { message: NO_UNIQUE_MESSAGE },
            length: { in: 1..15, message: '15文字以内' },
            format: {
              with: /\A[a-zA-Z0-9\_]+\z/,
              message: '英数字又は_(アンダースコア)のみ入力してください'
            }

  validates :password,
            presence: { message: NO_PRESENCE_MESSAGE },
            length: { in: 4..32, message: '4文字以上32文字以内で入力してください' },
            format: {
              with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[!-~&&[^a-zA-Z\d]])[!-~]+\z/,
              message: '半角英小文字/大文字/数字/記号を1文字以上用いてください'
            }

  validates :about,
            length: { maximum: 100, message: '100文字以内' }

  def pets
    Cg::Pet.where(cg_pets: { users_id: id })
  end

  def detail
    Cg::UserDetail.find_by(users_id: id)
  end
end
