# frozen_string_literal: true

class Cg::CgAppController < Cg::LayoutsController
  def index
    return unless session[:login_state] == 'OK'

    @user = Cg::User.find(session[:user_id])
    render :home
  end
end
