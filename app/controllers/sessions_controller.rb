# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to '/CuteGift/login'
  end

  def change_user_mode
    login_check
    save_user_mode params[:user_mode]
    redirect_to '/CuteGift/mypage'
  end
end
