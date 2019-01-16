# frozen_string_literal: true

class Cg::DmGroupsController < Cg::LayoutsController
  def list
    login_check
    @user = session_user
    @host_share_dm_groups = Cg::ShareDmGroup.eager_load(:share)
                                            .where(
                                              cg_shares: {
                                                pet_id: Cg::Pet.where(user_id: @user.id).select(:id)
                                              }
                                            )
    @user_share_dm_groups = Cg::ShareDmGroup.eager_load(:share)
                                            .where(cg_shares: { user_id: @user.id })
  end

  def show
    login_check
    @user = session_user
    @dm_group = Cg::DmGroup.find(params[:dm_group_id])
    return unless @user.accesable? @dm_group

    @page = 0
    @log_disp_id = params[:log_disp_id]

    @page = params[:page] if params[:page].present?

    if @log_disp_id.nil?
      @log_disp_id = -1
      last = Cg::Dm.where(dm_group_id: @dm_group.id).last
      @log_disp_id = last.id if last.present?
    end

    if @log_disp_id != -1
      last = Cg::Dm.find(@log_disp_id)
      @dms = Cg::Dm.where(dm_group_id: @dm_group.id)
                   .or(Cg::Dm.where('created_at >= ?', last.created_at))
                   .order('created_at DESC')
                   .page(@page).per(8)
    else
      @dms = []
    end

    respond_to do |format|
      format.html {
        if @dm_group.type == 'Cg::ShareDmGroup'
        @role = @dm_group.share.user == @user ? :user : :host
          render 'show_share', layout: 'cg_layouts_width_stuffing'
        end
      }
      format.js {
        render 'show'
      }
    end
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
