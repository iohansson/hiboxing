class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Необходима авторизация"
    end
  end
end
