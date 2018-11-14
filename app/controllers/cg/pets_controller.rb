# frozen_string_literal: true

class Cg::PetsController < CgLayoutsController
  def new
    login_check
    mode_check
    return unless params[:cg_pet].present?

    @pet = Cg::Pet.new(
      users_id: session[:user_id],
      name: params[:cg_pet][:name],
      petname: params[:cg_pet][:petname],
      types_id: params[:cg_pet][:types_id],
      about: params[:cg_pet][:about],
      cg_pet_detail_attributes: {}
    )
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
end
