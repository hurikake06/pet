# frozen_string_literal: true

class Cg::Pet < ApplicationRecord
  belongs_to :cg_user, foreign_key: :users_id, primary_key: :id, class_name: 'Cg::User'
  belongs_to :cg_type, foreign_key: :types_id, primary_key: :id, class_name: 'Cg::Type'
  has_many :cg_shares, class_name: 'Cg::Share'

  validates :users_id, presence: true
  validates :name, presence: true
  validates :petname, presence: true
  validates :types_id, presence: true

  def type
    Cg::Type.find(types_id)
  end
end
