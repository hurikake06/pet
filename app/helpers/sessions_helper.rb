module SessionsHelper
  def login_check
    redirect_to '/CuteGift/login' unless session[:login_state] == 'OK'
  end

  def save_user_mode param
    if param == 'HOST'
      session[:user_mode] = 'HOST'
    else
      session[:user_mode] = 'USER'
    end
  end

  def wrong_user_mode
    login_check
    @user = Cg::User.find(session[:user_id])
    render 'cg/users/login'
  end

end
