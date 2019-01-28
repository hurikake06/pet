# frozen_string_literal: true

class Cg::EvsController < Cg::LayoutsController
  def edit
    @ev = Cg::Ev.find(params[:ev_id])
    return unless @ev.present?
    return if @ev.info == 1503

    share = @ev.share
    case @ev.type
    when 'Cg::UserEv' then
      # ユーザについてのレビュー
      @ev = nil unless session_user.id == share.pet.user_id
    when 'Cg::HostEv' then
      # ホストについてのレビュー
      @ev = nil unless session_user.id == share.user_id
    end
  end

  def update
    @ev = Cg::Ev.find(params[:ev_id])
    return unless @ev.present?
    return if @ev.info == 1503

    share = @ev.share
    case @ev.type
    when 'Cg::UserEv' then
      # ユーザについてのレビュー
      return unless params[:cg_user_ev].present?
      return unless session_user.id == share.pet.user_id

      ev_params = ev_user_params
    when 'Cg::HostEv' then
      # ホストについてのレビュー
      return unless params[:cg_host_ev].present?
      return unless session_user.id == share.user_id

      ev_params = ev_host_params
    end
    @ev_edit = Marshal.load(Marshal.dump(@ev))
    ev_params[:ev_info] = 1502
    @ev = @ev_edit if @ev_edit.update(ev_params)
    render :edit
  end

  private

  def ev_user_params
    params.require(:cg_user_ev).permit(
      :val
    )
  end

  def ev_host_params
    params.require(:cg_host_ev).permit(
      :val
    )
  end
end
