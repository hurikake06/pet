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
    redirect_to mypage_pet_path @pet.petname if login_flag && session[:user_id] == @pet.user.id
  end

  def edit
    login_check
    @pet_edit = Cg::Pet.find_by(petname: params[:petname])
    @pet = Cg::Pet.find_by(petname: params[:petname])
    return unless @pet_edit.present?
    return unless params[:cg_pet].present?

    @pet_edit = @pet_edit.user.id == session[:user_id] ? @pet_edit : nil
    if @pet_edit.update(pet_edit_params @pet_edit)
      @pet = @pet_edit
    end
  end

  def pet_new_params
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

  def pet_edit_params pet
    params[:cg_pet][:detail_attributes] = params[:cg_pet][:cg_pet_detail]
    params[:cg_pet][:medical_info] = pet[:medical_info]
    params[:cg_pet][:detail_attributes][:id] = pet.detail.id
    params.require(:cg_pet).permit(
      :name,
      :types_id,
      :about,
      detail_attributes: [
        :id,
        :variable_cost,
        :fixed_cost,
        :share_about
      ]
    )
  end
end
