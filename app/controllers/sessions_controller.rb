# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to '/CuteGift/user/login'
  end
end
