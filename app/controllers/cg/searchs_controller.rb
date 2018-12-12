# frozen_string_literal: true

class Cg::SearchsController < Cg::LayoutsController
  def index
    if params[:keyword].present?
      @keyword = params[:keyword]
      @pets = Cg::Pet.where('name LIKE ?', "%#{@keyword}%")
                     .or(Cg::Pet.where('petname LIKE ?', "%#{@keyword}%"))
      @users = Cg::User.where('name LIKE ?', "%#{@keyword}%")
                       .or(Cg::Pet.where('username LIKE ?', "%#{@keyword}%"))
    else
      @pets = Cg::Pet.all
      @users = Cg::User.all
    end
  end
end
