# frozen_string_literal: true

class Cg::CgAppController < Cg::LayoutsController
  def index
    if login_flag
      home
    else
      render layout: 'cg_layouts_width_stuffing'
    end
  end

  def home
    @user = session_user
    @pets = Cg::Pet.all
    @users = Cg::User.all

    render :home, layout: 'cg_layouts_width_stuffing'
  end

  def demo
    render layout: 'cg_layouts_width_stuffing'
  end
end
