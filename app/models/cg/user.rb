# frozen_string_literal: true

class Cg::User < ApplicationRecord
  belongs_to :share_user, foreign_key: :share_user_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :share_host, foreign_key: :share_host_info, primary_key: :id, class_name: 'Cg::Info'
  has_one :detail, class_name: 'Cg::UserDetail', inverse_of: :user
  has_many :pets, class_name: 'Cg::Pet'
  has_many :user_shares, class_name: 'Cg::Share'

  has_many :dms, class_name: 'Cg::Dm'
  accepts_nested_attributes_for :detail

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

  def host_shares
    Cg::Share.where(pet_id: pets.select(:id))
  end

  def share_host_flag
    share_host_info == 15
  end

  def share_user_flag
    share_user_info == 13
  end

  def accesable?(group)
    group.host.id == id || group.user.id == id
  end
end
