# frozen_string_literal: true

class Cg::EvsController < Cg::LayoutsController

  def new
    login_check
    @user = session_user
    if params[:share_id].present?
      share = Cg::Share.find(params[:share_id])
      if share.present?
        if share.pet.user_id == @user.id
          @ev = Cg::UserEv.new
        elsif share.user_id == @user.id
          @ev = Cg::HostEv.new
        end
      end
    end
  end

  def create
    login_check
    @user = session_user
    if params[:share_id].present?
      share = Cg::Share.find(params[:share_id])
      if share.present?
        if share.pet.user_id == @user.id
          if params[:cg_user_ev].present?
            params[:cg_user_ev][:share_id] = params[:share_id]
            @ev = Cg::UserEv.new(new_ev_user_params)
            if @ev.save
              redirect_to cg_evs_path(@ev.id)
            else
              render :new
            end
          end
        elsif share.user == @user
          if params[:cg_host_ev].present?
            params[:cg_host_ev][:share_id] = params[:share_id]
            @ev = Cg::HostEv.new(new_ev_host_params)
          end
        end
      end
    end
  end

  def edit
    @ev = Cg::Ev.find(params[:ev_id])
  end

  def update
    @ev = Cg::Ev.find(params[:ev_id])
    @ev_edit = Marshal.load(Marshal.dump(@ev))
    return unless @ev.present?
    share = Cg::Share.find(@ev.share_id)
    if @ev.type == 'Cg::UserEv'
      return unless params[:cg_user_ev].present?
      return unless session_user.id == share.pet.user_id
      @ev = @ev_edit if @ev_edit.update(ev_user_params)
    else
      return unless params[:cg_host_ev].present?
      return unless session_user.id == share.user_id
      @ev = @ev_edit if @ev_edit.update(ev_host_params)
    end
    render :edit
  end

  private

  def new_ev_user_params
    params.require(:cg_user_ev).permit(
      :val,
      :share_id
    )
  end

  def ev_user_params
    params.require(:cg_user_ev).permit(
      :val
    )
  end

  def new_ev_host_params
    params.require(:cg_host_ev).permit(
      :val,
      :share_id
    )
  end

  def ev_host_params
    params.require(:cg_host_ev).permit(
      :val
    )
  end

end
