# frozen_string_literal: true

class Cg::PetsController < Cg::LayoutsController
  def new
    login_check
  end

  def show
    @pet = Cg::Pet.find_by(petname: params[:petname])
    render 'cg/pets/mypage' if login_flag && session[:user_id] == @pet.user.id
  end

  def edit
    login_check
    @pet = Cg::Pet.find_by(petname: params[:petname])
  end

  def create
    login_check
    @pet = Cg::Pet.new(pet_new_params)
    @saved = @pet.save
    if @saved
      redirect_to cg_pets_path @pet.petname
    else
      render :new
    end
  end

  def update
    @pet = Cg::Pet.find_by(petname: params[:petname])
    @pet_edit = Marshal.load(Marshal.dump(@pet))
    return unless @pet_edit.present?
    return unless params[:cg_pet].present?

    @pet_edit = @pet_edit.user.id == session[:user_id] ? @pet_edit : nil
    @pet = @pet_edit if @pet_edit.update(pet_edit_params(@pet))
    render :edit
  end

  def destroy; end

  private

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

  def pet_edit_params(pet)
    params[:cg_pet][:detail_attributes] = params[:cg_pet][:cg_pet_detail]
    params[:cg_pet][:medical_info] = pet[:medical_info]
    params[:cg_pet][:detail_attributes][:id] = pet.detail.id
    params.require(:cg_pet).permit(
      :name,
      :icon,
      :type_id,
      :about,
      detail_attributes: %i[
        id
        variable_cost
        fixed_cost
        share_about
      ]
    )
  end
end
