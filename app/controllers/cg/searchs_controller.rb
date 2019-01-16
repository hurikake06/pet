# frozen_string_literal: true

class Cg::SearchsController < Cg::LayoutsController
  def index
    @searched = false
    if params[:keyword].present?
      @searched = true
      @keyword = params[:keyword]
      @pets = Cg::Pet.where('name LIKE ?', "%#{@keyword}%")
                     .or(Cg::Pet.where('petname LIKE ?', "%#{@keyword}%"))
                     .page(0).per(3)

      @users = Cg::User.where('name LIKE ?', "%#{@keyword}%")
                       .or(Cg::User.where('username LIKE ?', "%#{@keyword}%"))
                       .page(0).per(3)
    end
  end

  def pet_index
    @searched = false
    if params[:keyword].present?
      @searched = true
      @keyword = params[:keyword]
      @pets = Cg::Pet.where('name LIKE ?', "%#{@keyword}%")
                     .or(Cg::Pet.where('petname LIKE ?', "%#{@keyword}%"))
                     .page(params[:page]).per(5)
    end
  end

  def user_index
    @searched = false
    if params[:keyword].present?
      @searched = true
      @keyword = params[:keyword]
      @users = Cg::User.where('name LIKE ?', "%#{@keyword}%")
                       .or(Cg::User.where('username LIKE ?', "%#{@keyword}%"))
                       .page(params[:page]).per(5)
    end
  end

  def category
    @types = Cg::Type.all
  end
end
