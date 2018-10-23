# frozen_string_literal: true

class Cg::CgAppController < CgLayoutsController
  def index
    if session[:login_state] == 'OK'
      @user = Cg::User.find(session[:user_id])
      render :home
    end
  end
end
