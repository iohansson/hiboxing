class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    #to do: set default value to admin attr
    @user.admin = false
    if @user.save
      #log in created user
      session[:user_id] = @user.id
      redirect_to dashboard_url, notice: 'Добро пожаловать!'
    else
      redirect_to login_url, notice: 'Регистрация неудачна'
    end
  end
  
  def new
    @user = User.new
    @user.sportsman = Sportsman.new
  end
end
