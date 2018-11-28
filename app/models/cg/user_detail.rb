# frozen_string_literal: true

class Cg::UserDetail < ApplicationRecord
  belongs_to :user, class_name: 'Cg::User'
  belongs_to :document, foreign_key: :document_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :credit, foreign_key: :credit_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :country, foreign_key: :country_info, primary_key: :id, class_name: 'Cg::Info'
  belongs_to :sex, foreign_key: :sex_info, primary_key: :id, class_name: 'Cg::Info'
end
