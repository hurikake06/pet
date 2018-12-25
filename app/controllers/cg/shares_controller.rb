# frozen_string_literal: true

class Cg::SharesController < Cg::LayoutsController
  def new
    return unless session_user&.share_user_flag
    return unless params[:petname].present?

    pet = Cg::Pet.find_by(petname: params[:petname])
    return unless pet&.share_flag

    @pet = pet
  end


  def list
    login_check
    @user = session_user
  end

  def show
    login_check
    set_share
    return unless @share.present?
    if check_shre_user
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
    p 'update'
    set_share
    @saved = nil
    case params[:method].presence
    when 'update_info' then
      @user_mode = :host
      redirect_to cg_shares_root_path unless check_share_host
      update_info
    when 'update_user' then
      @user_mode = :user
      redirect_to cg_shares_root_path unless check_share_user
      update_user
    when 'update_host' then
      redirect_to cg_shares_root_path unless check_share_host
      @user_mode = :host
      update_host
    else
      p params[:method].presence&.to_s
    end

    @to_page = "cg/shares/#{@user_mode}/show"
    render :show
  end

  # 未実装
  def update_user
    p 'update_user'
    redirect_to cg_shares_path params[:share_id]
  end

  # 未実装
  def update_host
    p 'update_host'
    redirect_to cg_shares_path params[:share_id]
  end

  def update_info
    p 'update_info'
    flag = false

    case @share.share_id
    when 1 then
      flag = [2, 3].include? params[:share_id]
    when 2 then
      flag = [4].include? params[:share_id]
    when 3 then
      flag = [2].include? params[:share_id]
    end

    if flag
      @share.share_info = params[:share_info]
      @saved = @share.save
    end
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

  # 申請者か？
  def check_shre_user
    @share.user_id == session[:user_id]
  end

  # 申請された側か？
  def check_share_host
    @share.pet.user_id == session[:user_id]
  end
end
