# frozen_string_literal: true

class Cg::Dm < ApplicationRecord
  belongs_to :user, class_name: 'Cg::User'
end
