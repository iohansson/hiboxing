class Admin::ApplicationController < ApplicationController
  layout 'admin'
  
  before_filter { |c| c.authorize true } #require admin
  
  protected
  
  def authorize(admin)
    unless User.find_by_id_and_admin(session[:user_id],admin)
      redirect_to admin_login_url, notice: "Необходима авторизация"
    end
  end
end
