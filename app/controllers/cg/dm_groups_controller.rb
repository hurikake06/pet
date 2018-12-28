# frozen_string_literal: true

class Cg::DmGroupsController < Cg::LayoutsController
  def list; end

  def show
    login_check
  end

  def show_share
    login_check
    dmGroup = Cg::DmGroup.find_by(share_id: params[:share_id])
    if dmGroup.nil?
      dmGroup = Cg::ShareDmGroup.create!(share_id: params[:share_id])
    end
    redirect_to cg_dm_groups_path dmGroup.id
  end

  def show_user
    login_check
    pet = Cg::Pet.find(params[:pet_id])
    return if pet.user_id == session_user.id
    dmGroup = Cg::DmGroup.find_by(pet_id: pet.id,user_id: session_user.id)
    if dmGroup.nil?
      dmGroup = Cg::UserDmGroup.create!(pet_id: pet.id,user_id: session_user.id)
    end
    redirect_to cg_dm_groups_path dmGroup.id
  end

  def new; end
end
