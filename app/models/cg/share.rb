# frozen_string_literal: true

class Cg::Share < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_pet, foreign_key: :pets_id, primary_key: :id, class_name: 'Cg::Pet'
  has_one :cg_share_detail, class_name: 'Cg::ShareDetail', foreign_key: :shares_id, inverse_of: :cg_share
  has_many :cg_evs, class_name: 'Cg::Ev'
  accepts_nested_attributes_for :cg_share_detail

  def user
    Cg::User.find(users_id)
  end

  def pet
    Cg::Pet.find(pets_id)
  end

  def info
    Cg::Info.find(share_info)
  end

  def detail
    Cg::ShareDetail.find_by(shares_id: id)
  end
end
