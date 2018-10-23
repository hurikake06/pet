# frozen_string_literal: true

class Cg::PetsController < CgLayoutsController
  def new; end

  def edit; end

  def mypage
    if session[:login_state] == 'OK'
      @pet = Cg::Pet.find_by( petname: params[:petname])
      redirect_to '/CuteGift/login' unless @pet.present?
    else
      redirect_to '/CuteGift/login'
    end
  end

  def show
    # user = Cg::User.find_by(username: params[:username])
    @pet = Cg::Pet.find_by(petname: params[:petname])
    redirect_to '/CuteGift/login' unless @pet.present?
  end
end
