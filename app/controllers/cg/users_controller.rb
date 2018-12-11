# frozen_string_literal: true

class Cg::UsersController < Cg::LayoutsController
  protect_from_forgery except: :pass_check
  def new
    return unless params[:cg_user].present?

    @user = Cg::User.new(user_params)
    @saved = @user.save
  end

  def login
    reset_session
  end

  # ユーザ名とパスワードが正しい場合、
  # セッション変数:user_idにユーザのIDを入れ、:login_stateをOKにする
  def pass_check
    render 'cg/users/login' unless params[:user_mode].present? && params[:cg_user].present?
    save_user_mode params[:user_mode]
    user = Cg::User.exists?(username: params[:cg_user][:username]) ? Cg::User.find_by(username: params[:cg_user][:username]) : nil

    if user.present? && user.password == params[:cg_user][:password]
      session[:user_id] = user.id
      session[:login_state] = 'OK'
      redirect_to mypage_root_path
    else
      @error_code = '入力内容が間違っています'
      render 'cg/users/login'
    end
  end

  def mypage
    login_check
    @user = Cg::User.find(session[:user_id])
  end

  def show
    user = Cg::User.find_by(username: params[:username])
    return unless user.present?
    redirect_to mypage_root_path if session[:login_state] == 'OK' && session[:user_id] == user[:id]
  end

  def edit
    login_check
    @user = Cg::User.find(session[:user_id])
  end

  private

  def user_params
    params[:cg_user][:detail_attributes] = {}
    params.require(:cg_user).permit(
      :name,
      :username,
      :email,
      :password,
      :about,
      detail_attributes: {}
    )
  end
end
