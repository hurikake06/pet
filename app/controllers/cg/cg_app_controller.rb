# frozen_string_literal: true

class Cg::CgAppController < Cg::LayoutsController
  def index
    return unless login_flag

    @user = session_user
    render :home
  end
end
