# frozen_string_literal: true

class Cg::SearchsController < Cg::LayoutsController
  def index
    @pets = Cg::Pet.all
    @users = Cg::User.all
  end
end
