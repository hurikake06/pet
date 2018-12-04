# frozen_string_literal: true

module SessionsHelper
  def login_check
    redirect_to '/CuteGift/login' unless session[:login_state] == 'OK'
  end

  def share_info_flag
    return false unless session[:login_state] == 'OK'

    share_info = session[:user_mode] == 'HOST' ? :share_host_info : :share_user_info
    flag = Cg::User.select(share_info).find(session[:user_id])[share_info]
    [13, 15].include?(flag)
  end

  def save_user_mode(param)
    session[:user_mode] = param == 'HOST' ? 'HOST' : 'USER'
  end

  def wrong_user_mode
    login_check
    @user = Cg::User.find(session[:user_id])
    render 'cg/users/login'
  end
end
