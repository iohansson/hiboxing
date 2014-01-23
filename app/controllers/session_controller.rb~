class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      render :new, notice: 'Войти не удалось'
    end
  end

  def destroy
  end
end
