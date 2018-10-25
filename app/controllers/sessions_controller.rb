# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to '/CuteGift/login'
  end

  def mode_change
    login_check
    session[:user_mode] = session[:user_mode] == 'HOST' ? 'USER' : 'HOST'
    redirect_to '/CuteGift/mypage'
  end
end
