class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to  signin_path, alert: "Youuuuu, what are you doing here? you have tolog in before" if Current.user.nil? 
  end
end
