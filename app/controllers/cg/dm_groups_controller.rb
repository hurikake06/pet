# frozen_string_literal: true

class Cg::DmGroupsController < Cg::LayoutsController
  def list
    login_check
    @user = session_user
    host_share_dm_groups = Cg::ShareDmGroup.eager_load(:share)
                                           .where(
                                             cg_shares: {
                                               pet_id: Cg::Pet.where(user_id: @user.id).select(:id)
                                             }
                                           )
    user_share_dm_groups = Cg::ShareDmGroup.eager_load(:share)
                                           .where(cg_shares: { user_id: @user.id })
  end

  def show
    login_check
  end

  def show_share
    login_check
    dm_group = Cg::ShareDmGroup.find_by(share_id: params[:share_id])
    if dm_group.nil?
      dm_group = Cg::ShareDmGroup.create!(share_id: params[:share_id])
    end
    redirect_to cg_dm_groups_path dm_group.id
  end

  def show_user
    login_check
    pet = Cg::Pet.find(params[:pet_id])
    return if pet.user_id == session_user.id

    dm_group = Cg::UserDmGroup.find_by(pet_id: pet.id, user_id: session_user.id)
    if dm_group.nil?
      dm_group = Cg::UserDmGroup.create!(pet_id: pet.id, user_id: session_user.id)
    end
    redirect_to cg_dm_groups_path dm_group.id
  end
end
