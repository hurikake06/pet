# frozen_string_literal: true

class Cg::DmGroup < ApplicationRecord
  has_many :cg_dms, class_name: 'Cg::Dm'

  def host
    raise 'NotImplemented'
  end

  def user
    raise 'NotImplemented'
  end
end
