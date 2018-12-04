# frozen_string_literal: true

class Cg::Share < ApplicationRecord
  belongs_to :user, class_name: 'Cg::User'
  belongs_to :pet, class_name: 'Cg::Pet'
  belongs_to :info, foreign_key: :share_info, primary_key: :id, class_name: 'Cg::Info'
  has_one :detail, class_name: 'Cg::ShareDetail', inverse_of: :share
  has_many :evs, class_name: 'Cg::Ev'
  accepts_nested_attributes_for :detail
end
