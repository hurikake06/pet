# frozen_string_literal: true

class Cg::DmsController < Cg::LayoutsController
  def new; end

  def create
    login_check
    @user = session_user

    Cg::Dm.create!(dm_new_params)
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
