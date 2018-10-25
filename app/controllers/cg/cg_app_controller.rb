# frozen_string_literal: true

class Cg::CgAppController < CgLayoutsController
  def index
    return unless session[:login_state] == 'OK'

    @user = Cg::User.find(session[:user_id])
    if session[:user_mode] == 'HOST'
      render 'cg/cg_app/host/home'
    else
      render :home
    end
  end
end
