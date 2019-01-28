# frozen_string_literal: true

class SessionsController < ApplicationController
  def destroy
    reset_session
    redirect_to cg_root_path
  end
end
