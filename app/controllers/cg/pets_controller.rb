# frozen_string_literal: true

class Cg::PetsController < CgLayoutsController
  def new
    login_check
    mode_check
    return unless params[:cg_pet].present?
    p "--pet_params--"
    p pet_params.to_json
    @pet = Cg::Pet.new(pet_params)
    @saved = @pet.save
  end

  def mypage
    login_check
    mode_check
    @pet = Cg::Pet.find_by(petname: params[:petname])
  end

  def show
    @pet = Cg::Pet.find_by(petname: params[:petname])
  end

  def mode_check
    wrong_user_mode unless session[:user_mode] == 'HOST'
  end

  def edit
    login_check
    return unless params[:petname].present?

    @pet = Cg::Pet.find_by(petname: params[:petname])
    return unless @pet.present?

    @pet = @pet.user.id == session[:user_id] ? @pet : nil
  end

  def pet_params
    params[:cg_pet][:users_id] = session[:user_id]
    params[:cg_pet][:cg_pet_detail_attributes] = {}
    params.require(:cg_pet).permit(
      :users_id,
      :name,
      :petname,
      :types_id,
      :about,
      cg_pet_detail_attributes: {}
    )
  end
end
