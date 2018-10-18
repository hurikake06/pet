# frozen_string_literal: true

class Cg::UsersController < CgLayoutsController
  def new; end

  def login
    @error_code = session[:error_code]
    reset_session
  end

  # ユーザ名とパスワードが正しい場合、
  # セッション変数:user_idにユーザのIDを入れ、:login_stateをOKにする
  def login_check
    user = params[:cg_user] ? Cg::User.find_by(username: params[:cg_user][:username]) : nil
    if user.present? && user[:password] == params[:cg_user][:password]
      session[:user_id] = user.id
      session[:login_state] = 'OK'
      redirect_to '/CuteGift/user/mypage'
    else
      session[:user] = params[:cg_user]
      session[:error_code] = '入力内容が間違っています'
      redirect_to '/CuteGift/user/login'
    end
  end

  def mypage
    if session[:login_state] == 'OK'
      @user = Cg::User.find_by(id: session[:user_id])
      @pet_list = Cg::Pet.joins(:cg_type)
                         .select('cg_pets.*,cg_types.name as types_name')
                         .where(cg_pets: { users_id: session[:user_id] })
    else
      redirect_to '/CuteGift/user/login'
    end
  end

  def show
    user = Cg::User.find_by(username: params[:username])
    return unless user.present?

    if session[:login_state] == 'OK' && session[:user_id] == user[:id]
      redirect_to '/CuteGift/user/mypage'
    else
      @user = user
      @pet_list = Cg::Pet.joins(:cg_type)
                         .select('cg_pets.*,cg_types.name as types_name')
                         .where(cg_pets: { users_id: user.id })
    end
  end
end
