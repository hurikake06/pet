# frozen_string_literal: true

class Cg::Facility < ApplicationRecord
  has_many :pets_facilities, class_name: 'Cg::PetsFacility'
  has_many :pets, class_name: 'Cg::Pet', through: :pets_facilities
  has_many :share_details, class_name: 'Cg::ShareDetail'
end
