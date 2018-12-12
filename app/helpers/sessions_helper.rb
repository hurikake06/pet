# frozen_string_literal: true

module SessionsHelper
  def login_check
    redirect_to '/CuteGift/login' unless login_flag
  end

  def login_flag
    session[:login_state] == 'OK'
  end

  def session_user
    Cg::User.find(session[:user_id]) if login_flag
  end

  def save_user_mode(param)
    session[:user_mode] = param == 'HOST' ? 'HOST' : 'USER'
  end
end
