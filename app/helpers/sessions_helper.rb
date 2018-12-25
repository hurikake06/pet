# frozen_string_literal: true

module SessionsHelper
  def login_check
    redirect_to cg_login_path unless login_flag
  end

  def login_flag
    session[:login_state] == 'OK'
  end

  def session_user
    Cg::User.find(session[:user_id]) if login_flag
  end
end
