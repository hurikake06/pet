# frozen_string_literal: true

class Cg::Pet < ApplicationRecord
  belongs_to :user, class_name: 'Cg::User'
  belongs_to :type, class_name: 'Cg::Type'
  belongs_to :sex, foreign_key: :pets_sex_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :share_pet, foreign_key: :share_pet_info, class_name: 'Cg::Info'
  has_many :pets_facilities, class_name: 'Cg::PetsFacility'
  has_many :facilities, class_name: 'Cg::Facility', through: :pets_facilities
  has_many :pets_infos, class_name: 'Cg::PetsInfo'
  has_many :infos, class_name: 'Cg::Info', through: :pets_infos
  has_many :shares, class_name: 'Cg::Share'
  has_one :detail, class_name: 'Cg::PetDetail', inverse_of: :pet
  accepts_nested_attributes_for :detail

  validates :user_id, presence: true

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

  validates :type_id, presence: true

end
