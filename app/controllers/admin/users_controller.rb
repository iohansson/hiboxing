class Admin::UsersController < Admin::ApplicationController

  before_filter :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def edit
    render :new
  end
  
  def create
    user = User.new(params[:user])
    if user.save
      redirect_to admin_users_path, notice: 'Пользователь добавлен'
    else
      render :new, notice: 'Не удалось сохранить пользователя'
    end
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, notice: 'Пользователь изменен'
    else
      render :new, notice: 'Не удалось сохранить пользователя'
    end
  end
  
  protected
  
  def set_user
    @user = User.find(params[:id])
  end
end
