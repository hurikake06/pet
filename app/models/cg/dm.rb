# frozen_string_literal: true

class Cg::Dm < ApplicationRecord
  belongs_to :group, class_name: 'Cg::DmGroup'
  belongs_to :user, class_name: 'Cg::User'
end
