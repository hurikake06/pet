# frozen_string_literal: true

class Cg::UserDetail < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_info, foreign_key: :document_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :cg_info, foreign_key: :credit_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :cg_info, foreign_key: :country_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :cg_info, foreign_key: :sex_info, primary_key: :id, class_name: 'Cg::Info'

  def user_shares
    Cg::Share.where(users_id: users_id)
  end

  def host_shares
    Cg::Share.where(pets_id: Cg::Pet.select(:id).where(users_id: users_id))
  end
end
