module SessionsHelper
  def login_check
    redirect_to '/CuteGift/login' unless session[:login_state] == 'OK'
  end

  def change_user_mode
    login_check
    @user = Cg::User.find(session[:user_id])
    render 'cg/users/login'
  end
end
