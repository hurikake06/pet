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
      ActionCable.server.broadcast "dm_#{@dm_group.id}_channel",
                                   html: render(partial: '/cg/dms/dm', locals: { dm: dm, user: @user })
      head :ok
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
