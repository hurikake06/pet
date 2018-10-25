# frozen_string_literal: true

class Cg::UsersController < CgLayoutsController
  def new; end

  def login
    reset_session
  end

  # ユーザ名とパスワードが正しい場合、
  # セッション変数:user_idにユーザのIDを入れ、:login_stateをOKにする
  def pass_check
    session[:user_mode] = params[:user_mode]
    user = params[:cg_user] ? Cg::User.find_by(username: params[:cg_user][:username]) : nil
    if user.present? && user.password == params[:cg_user][:password]
      session[:user_id] = user.id
      session[:login_state] = 'OK'
      redirect_to '/CuteGift/mypage'
    else
      @error_code = '入力内容が間違っています'
      render 'cg/users/login'
    end
  end

  def mypage
    login_check
    @user = Cg::User.find_by(id: session[:user_id])
    render 'cg/users/host/mypage' if session[:user_mode] == 'HOST'
  end

  def show
    user = Cg::User.find_by(username: params[:username])
    return unless user.present?

    if session[:login_state] == 'OK' && session[:user_id] == user[:id]
      redirect_to '/CuteGift/mypage'
    else
      @user = user
      render 'cg/users/host/show' if session[:user_mode] == 'HOST'
    end
  end
end
