class Cg::Info < ApplicationRecord
  belongs_to :cg_info_type, foreign_key: :info_types_id, primary_key: :id, class_name: 'Cg::InfoType'
  has_many :cg_type, class_name: 'Cg::Type'
  has_many :cg_pet, class_name: 'Cg::Pet'
  has_many :cg_pet_detail, class_name: 'Cg::PetDetail'
  has_many :cg_user, class_name: 'Cg::User'
  has_many :cg_user_detail, class_name: 'Cg::UserDetail'
end
