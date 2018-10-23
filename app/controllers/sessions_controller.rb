# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to '/CuteGift/login'
  end
end
