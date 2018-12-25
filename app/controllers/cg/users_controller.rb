# frozen_string_literal: true

class Cg::UsersController < Cg::LayoutsController
  protect_from_forgery except: :pass_check
  def new; end

  def login
    reset_session
  end

  def show
    @user = Cg::User.find_by(username: params[:username])
    return unless @user.present?

    render 'cg/users/mypage' if login_flag && session[:user_id] == @user[:id]
  end

  # ユーザ名とパスワードが正しい場合、
  # セッション変数:user_idにユーザのIDを入れ、:login_stateをOKにする
  def pass_check
    redirect_to cg_logint_path unless params[:cg_user].present?
    user = Cg::User.exists?(username: params[:cg_user][:username]) ? Cg::User.find_by(username: params[:cg_user][:username]) : nil

    if user.present? && user.password == params[:cg_user][:password]
      session[:user_id] = user.id
      session[:login_state] = 'OK'
      redirect_to cg_users_path user.username
    else
      @error_code = '入力内容が間違っています'
      render 'cg/users/login'
    end
  end

  def create
    @user = Cg::User.new(user_params)
    @saved = @user.save

    if @saved
      session[:user_id] = @user.id
      session[:login_state] = 'OK'
      redirect_to cg_users_path @user.username
    else
      render :new
    end
  end

  def update
    @user = session_user
    @user_edit = Marshal.load(Marshal.dump(@user))
    return unless @user.present?
    return unless params[:cg_user].present?
    @user = @user_edit if @user_edit.update(user_edit_params @user)
    render :edit
  end

  def destroy; end

  def edit
    login_check
    @user = session_user
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

  def user_edit_params user
    params[:cg_user][:detail_attributes] = params[:cg_user][:cg_user_detail]
    params[:cg_user][:detail_attributes][:id] = user.detail.id
    params.require(:cg_user).permit(
      :name,
      :email,
      :about,
      detail_attributes: [
        :id,
        :first_name,
        :last_name,
        :address,
        :age,
        :sex_info,
        :country_info
      ]
    )
  end
end
