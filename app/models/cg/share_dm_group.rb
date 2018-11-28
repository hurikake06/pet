# frozen_string_literal: true

class Cg::ShareDmGroup < Cg::DmGroup
  belongs_to :share class_name: 'Cg::Share'

  def host
    share.pet.user
  end

  def user
    share.user
  end
end
