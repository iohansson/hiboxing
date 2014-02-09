class SessionController < ApplicationController
  def new
  end

  def create
    sportsman = Sportsman.find_by_email(params[:email])
    if sportsman && sportsman.authenticate(params[:password])
      session[:sportsman_id] = sportsman.id
      redirect_to edit_sportsman_path(sportsman)
    else
      render :new, notice: 'Войти не удалось'
    end
  end

  def destroy
  end
end
