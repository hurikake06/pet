# frozen_string_literal: true

class Cg::User < ApplicationRecord
  belongs_to :cg_info, foreign_key: :share_user_info, primary_key: :id, class_name: 'Cg::Info'
  has_many :cg_pets, class_name: 'Cg::Pet'
  has_many :cg_shares, class_name: 'Cg::Share'
  has_one :cg_user_detail, class_name: 'Cg::UserDetail'

  validates :email, format: {
    with: %r{\A([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-]+)*\z},
    message: '正しいメールアドレスを入力してください'
  }

  validates :username,
    length: { in: 1..15, message: '15文字以内' },
    format: {
      with: /\A[a-zA1-9\_]+\z/,
      message: '英数字又は_(アンダースコア)のみ入力してください'
    }

  validates :password,
    length: { in: 4..32, message: '4文字以上32文字以内で入力してください' },
    format: {
      with: %r{\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[!-~&&[^a-zA-Z\d]])[!-~]+\z},
      message: '半角英小文字/大文字/数字/記号を1文字以上用いてください'
    }

  def pets
    Cg::Pet.where(cg_pets: { users_id: id })
  end
end
