# frozen_string_literal: true

class Cg::PetsController < CgLayoutsController
  def new
    login_check
    mode_check
    return unless params[:cg_pet].present?

    @pet = Cg::Pet.create!(
      users_id: session[:user_id],
      name: params[:cg_pet][:name],
      petname: params[:cg_pet][:petname],
      types_id: params[:cg_pet][:types_id],
      about: params[:cg_pet][:about],
      cg_pet_detail_attributes: {}
    )
  rescue ActiveRecord::RecordInvalid => e
    @error_messages = e.record.errors.messages
  end

  def edit; end

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
end
