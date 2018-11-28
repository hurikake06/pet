# frozen_string_literal: true

class Cg::SharesController < CgLayoutsController
  def new
    login_check
    return unless share_info_flag
    return unless params[:petname].present?

    @pet = Cg::Pet.find_by(petname: params[:petname])
    return unless @pet.present? && @pet.share_pet_info == 17

    if params[:cg_share].present?
      # post
      @share = Cg::Share.new(share_params(@pet.id))
      @saved = @share.save
    else
      # get
    end
  end

  def list
    login_check
    if session[:user_mode] == 'HOST'
      @user = Cg::User.find(session[:user_id])
      # @shares = Cg::Share.where(pet_id: user.pets.select(:id))
      render 'cg/shares/host/list' if session[:user_mode] == 'HOST'
    else
      @user = Cg::User.find(session[:user_id])
    end
  end

  def show
    login_check
    share = Cg::Share.find(params[:share_id])
    if session[:user_mode] == 'HOST'
      @share = share if share.pet.user.id == session[:user_id]
      render 'cg/shares/host/show'
    elsif share.user_id == session[:user_id]
      @share = share
    end
  end

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
