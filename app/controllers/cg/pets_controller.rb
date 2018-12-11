# frozen_string_literal: true

class Cg::PetsController < Cg::LayoutsController
  def new
    login_check

    return unless params[:cg_pet].present?

    @pet = Cg::Pet.new(pet_params)
    @saved = @pet.save
  end

  def mypage
    login_check
    pet = Cg::Pet.find_by(petname: params[:petname])
    @pet = pet.user.id == session[:user_id]? pet : nil
  end

  def show
    @pet = Cg::Pet.find_by(petname: params[:petname])
    redirect_to mypage_pet_path @pet.petname if session[:login_state] == 'OK' && session[:user_id] == @pet.user.id
  end

  def edit
    login_check
    return unless params[:petname].present?

    @pet = Cg::Pet.find_by(petname: params[:petname])
    return unless @pet.present?

    @pet = @pet.user.id == session[:user_id] ? @pet : nil
  end

  def pet_params
    params[:cg_pet][:user_id] = session[:user_id]
    params[:cg_pet][:detail_attributes] = {}
    params.require(:cg_pet).permit(
      :user_id,
      :name,
      :petname,
      :type_id,
      :about,
      detail_attributes: {}
    )
  end
end
