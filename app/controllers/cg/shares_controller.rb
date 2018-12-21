# frozen_string_literal: true

class Cg::SharesController < Cg::LayoutsController
  def new
    return unless session_user&.share_user_flag
    return unless params[:petname].present?

    pet = Cg::Pet.find_by(petname: params[:petname])
    return unless pet&.share_flag

    @pet = pet
  end

  def update_user
    p 'update_user'
    redirect_to share_show_user_path params[:share_id]
  end

  def update_host
    p 'update_host'
    redirect_to share_show_host_path params[:share_id]
  end

  def list
    login_check
    @user = session_user
  end

  def show
    login_check
    share = Cg::Share.find(params[:share_id])

    if share.user_id == session[:user_id]
      # シェアユーザー
      @to_page = 'USER'
      @share = share
    elsif share.pet.user.id == session[:user_id]
      # シェアホスト
      @to_page = 'HOST'
      @share = share
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

  def update; end

  def destroy; end

  private

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
end
