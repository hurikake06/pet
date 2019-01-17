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
    @dm_group = Cg::DmGroup.where(share_id: @share).first
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
      share_info: 101
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
    p "----------update_info_host---------"
    p @share.share_info
    p params[:share_info]
    flag = false
    before = @share.share_info

    case @share.share_info
    when 101 then
      flag = [102, 152].include? params[:share_info].to_i
    when 102 then
      flag = [152, 104].include? params[:share_info].to_i
    when 103 then
      flag = [102, 152, 104].include? params[:share_info].to_i
    when 104 then
      flag = [155, 105].include? params[:share_info].to_i
    when 105 then
      flag = [106].include? params[:share_info].to_i
    end

    if flag
      @share.share_info = params[:share_info].to_i
      @saved = @share.save
      if @saved
        case @share.share_info
        when 102 then
          redirect_to cg_dm_groups_show_share_path share_id: @share.id
          if before == 101
            Cg::Dm.create!(dm_group_id: @dm_group.id, user_id: 0,
                           content: 'CuteGiftシェアサービスをご利用頂きありがとうございます',
                           command: 1
                          )
          end
        end
      end
    end
  end

  def update_info_user
    flag = false
    before = @share.share_info

    case @share.share_info
    when 101 then
      flag = [153].include? params[:share_info].to_i
    when 102 then
      flag = [153, 103].include? params[:share_info].to_i
    when 103 then
      flag = [153].include? params[:share_info].to_i
    when 104 then
      flag = [154].include? params[:share_info].to_i
    when 105 then
      flag = false
    when 106 then
      flag = [151].include? params[:share_info].to_i
    end

    if flag
      @share.share_info = params[:share_info].to_i
      if @share.save
        case @share.share_info
        when 103 then
          dm = Cg::Dm.new(dm_group_id: @dm_group.id, user_id: 0,
                         content: "#{@share.user.name}さんが再申請しました",
                         command: 1
                        )
          broadcast_dm dm, @dm_group
        end
      end
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

end
