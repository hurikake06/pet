# frozen_string_literal: true

class Cg::Info < ApplicationRecord
  belongs_to :cg_info_type, foreign_key: :info_types_id, primary_key: :id, class_name: 'Cg::InfoType'
  has_many :cg_types, class_name: 'Cg::Type'
  has_many :cg_pets, class_name: 'Cg::Pet'
  has_many :cg_pet_details, class_name: 'Cg::PetDetail'
  has_many :cg_users, class_name: 'Cg::User'
  has_many :cg_user_details, class_name: 'Cg::UserDetail'
  has_many :cg_pets_evs, class_name: 'Cg::Ev'
  has_many :cg_pets_dm_groups, class_name: 'Cg::DmGroup'
  has_many :cg_pets_infos, class_name: 'Cg::PetsInfo'
  has_many :cg_pets_through, class_name: 'Cg::Pet', through: :cg_pets_infos
end
