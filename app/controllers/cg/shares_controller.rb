# frozen_string_literal: true

class Cg::SharesController < Cg::LayoutsController
  def new
    return unless session_user&.share_user_flag
    return unless params[:petname].present?

    @pet = Cg::Pet.find_by(petname: params[:petname])
    return unless @pet.present? && @pet.share_flag

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
    @user = session_user
  end

  def show_user
    @to_page = 'USER'
    login_check
    share = Cg::Share.find(params[:share_id])
    @share = share if share.user_id == session[:user_id]
    render 'cg/shares/show'
  end

  def show_host
    @to_page = 'HOST'
    login_check
    share = Cg::Share.find(params[:share_id])
    @share = share if share.pet.user.id == session[:user_id]
    render 'cg/shares/show'
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
