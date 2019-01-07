# frozen_string_literal: true

class Cg::SharesController < Cg::LayoutsController
  def new
    return unless session_user&.share_user_flag
    return unless params[:petname].present?

    pet = Cg::Pet.find_by(petname: params[:petname])
    return unless pet&.share_flag

    @pet = pet
  end

  def edit
    @share = Cg::Share.find(params[:share_id])
    return unless @share.present?

    if check_share_user
      @form = 'cg/shares/user/edit_form'
    elsif check_share_host
      @form = 'cg/shares/host/edit_form'
    end
  end

  def list
    login_check
    @user = session_user
  end

  def show
    login_check
    set_share
    return unless @share.present?

    if check_share_user
      # シェアユーザー
      @to_page = 'cg/shares/user/show'
    elsif check_share_host
      # シェアホスト
      @to_page = 'cg/shares/host/show'
    else
      @share = nil
    end
  end

  def create
    @pet = Cg::Pet.find_by(petname: params[:petname])
    redirect_to cg_pets_path(pet.petname) unless session_user&.share_user_flag && @pet&.share_flag

    @share = Cg::Share.new(share_params(@pet.id))
    @saved = @share.save
    if @saved
      redirect_to cg_shares_root_path
    else
      render :new
    end
  end

  def update
    set_share
    @saved = nil
    set_share
    case params[:method].presence
    when 'update_info_host' then
      @user_mode = :host
      redirect_to cg_shares_root_path unless check_share_host
      update_info_host
    when 'update_info_user' then
      @user_mode = :user
      redirect_to cg_shares_root_path unless check_share_user
      update_info_user
    when 'update_user' then
      @user_mode = :user
      redirect_to cg_shares_root_path unless check_share_user
      update_user
    when 'update_host' then
      redirect_to cg_shares_root_path unless check_share_host
      @user_mode = :host
      update_host
    else
      @share = nil
      p 'update_else'
      p params[:method].presence&.to_s
    end

    @to_page = "cg/shares/#{@user_mode}/show"
    render :show
  end

  def destroy; end

  private

  def set_share
    @share = Cg::Share.find(params[:share_id])
  end

  def share_params(pets_id)
    params[:cg_share][:detail_attributes] = params[:cg_share][:cg_share_detail]
    params.require(:cg_share).permit(
      detail_attributes: %i[
        facility_id
        start
        end
        fixed_cost
        variable_cost
      ]
    ).merge(
      user_id: session[:user_id],
      pet_id: pets_id,
      share_info: 1
    )
  end

  def share_edit_params(share)
    params[:cg_share][:detail_attributes] = params[:cg_share][:cg_share_detail]
    params[:cg_share][:detail_attributes][:id] = share.detail.id
    params.require(:cg_share).permit(
      detail_attributes: %i[
        id
        facility_id
        start
        end
        fixed_cost
        variable_cost
      ]
    )
  end

  # 申請者か？
  def check_share_user
    @share.user_id == session[:user_id]
  end

  # 申請された側か？
  def check_share_host
    @share.pet.user_id == session[:user_id]
  end

  def update_user
    @share = Cg::Share.find_by(id: params[:share_id])
    @share_edit = Marshal.load(Marshal.dump(@share))
    return unless @share_edit.present?
    return unless params[:cg_share].present?

    @share = @share_edit if @share_edit.update(share_edit_params(@share))
  end

  def update_host
    @share = Cg::Share.find_by(id: params[:share_id])
    @share_edit = Marshal.load(Marshal.dump(@share))
    return unless @share_edit.present?
    return unless params[:cg_share].present?

    @share = @share_edit if @share_edit.update(share_edit_params(@share))
  end

  def update_info_host
    flag = false

    case @share.share_info
    when 1 then
      flag = [2, 3].include? params[:share_info]
    when 2 then
      flag = [4].include? params[:share_info]
    when 3 then
      flag = [2].include? params[:share_info]
    end

    if flag
      @share.share_info = params[:share_info]
      @saved = @share.save
    end
  end

  def update_info_user
    flag = false

    case @share.share_info
    when 1 then
      flag = [4].include? params[:share_info]
    when 2 then
      flag = [4].include? params[:share_info]
    when 3 then
      flag = [1].include? params[:share_info]
    end

    if flag
      @share.share_info = params[:share_info]
      @saved = @share.save
    end
  end
end
