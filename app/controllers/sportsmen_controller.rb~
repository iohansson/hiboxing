class SportsmenController < ApplicationController
  def create
    @sportsman = Sportsman.new(params[:sportsman])
    if @sportsman.save
      #log in created user
      session[:sportsman_id] = @sportsman.id
      redirect_to edit_sportsman_path(@sportsman), notice: 'Добро пожаловать!'
    else
      render :new, notice: 'Не получилось)'
    end
  end
  
  def new
    @sportsman = Sportsman.new(params[:sportsman])
  end
  
  def show
    @sportsman = Sportsman.find(params[:id])
  end
  
  def edit
    if session[:sportsman_id]
      @sportsman = Sportsman.find(session[:sportsman_id])
    else
      redirect_to login_url, notice: 'Авторизуйтесь'
    end
  end
end
