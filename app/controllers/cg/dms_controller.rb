# frozen_string_literal: true

class Cg::DmsController < Cg::LayoutsController
  def new; end

  def create
    login_check
    @user = session_user
    @dm_group = Cg::DmGroup.find params[:dm_group_id]
    return unless @user.accesable? @dm_group

    dm = Cg::Dm.new dm_new_params
    if dm.save
      broadcast_dm( dm, @dm_group)
    end
  end

  def broadcast_dm( dm, dm_group)
    if dm_group.type == 'Cg::ShareDmGroup'
      ActionCable.server.broadcast "dm_#{dm_group.id}_host_channel",
                                   html: render_to_string(partial: '/cg/dms/dm', locals: { dm: dm, user: dm_group.host })

      ActionCable.server.broadcast "dm_#{dm_group.id}_user_channel",
                                  html: render_to_string(partial: '/cg/dms/dm', locals: { dm: dm, user: dm_group.user })
    end
  end

  def dm_new_params
    params[:cg_dm][:dm_group_id] = params[:dm_group_id]
    params[:cg_dm][:user_id] = @user.id
    params.require(:cg_dm).permit(
      :user_id,
      :dm_group_id,
      :content
    )
  end
end
