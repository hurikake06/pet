# frozen_string_literal: true

class Cg::SharesController < CgLayoutsController
  def new
    login_check
    return unless share_info_flag
    return unless params[:petname].present?

    @pet = Cg::Pet.find_by(petname: params[:petname])
    return unless @pet.present? && @pet.share_pet_info == 17

    @share = Cg::Share.create!(
      users_id: session[:user_id],
      pets_id: @pet.id,
      share_info: 1
    )
  rescue ActiveRecord::RecordInvalid => e
    @error_messages = e.record.errors.messages
  end

  def list
    login_check
    if session[:user_mode] == 'HOST'
      user = Cg::User.find(session[:user_id])
      @shares = Cg::Share.where(pets_id: user.pets.select(:id))
      render 'cg/shares/host/list' if session[:user_mode] == 'HOST'
    else
      @shares = Cg::Share.where(users_id: session[:user_id])
    end
  end

  def show
    login_check
    share = Cg::Share.find(params[:shares_id])
    if session[:user_mode] == 'HOST'
      @share = share if share.pet.user.id == session[:user_id]
      render 'cg/shares/host/show'
    elsif share.users_id == session[:user_id]
      @share = share
    end
  end
end
