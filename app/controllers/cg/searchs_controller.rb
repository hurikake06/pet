# frozen_string_literal: true

class Cg::SearchsController < Cg::LayoutsController
  def index
    @searched = false
    if params[:keyword].present?
      @searched = true
      @keyword = params[:keyword]
      @pets = Cg::Pet.where('name LIKE ?', "%#{@keyword}%")
                     .or(Cg::Pet.where('petname LIKE ?', "%#{@keyword}%"))
      @users = Cg::User.where('name LIKE ?', "%#{@keyword}%")
                       .or(Cg::Pet.where('username LIKE ?', "%#{@keyword}%"))
    end
  end
end
