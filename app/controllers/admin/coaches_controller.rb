class Admin::CoachesController < Admin::ApplicationController
  before_filter :set_coach, only: [:edit,:update,:destroy]
  def index
    @coaches = Coach.all
  end
  
  def new
    @coach = Coach.new
  end
  
  def edit
    render :new
  end
  
  def create
    @coach = Coach.new(params[:coach])
    if @coach.save
      redirect_to admin_coaches_url, notice: 'Тренер добавлен'
    else
      render :new, notice: 'Ошибка при добавлении тренера'
    end
  end
  
  def update
    if @coach.update_attributes(params[:coach])
      redirect_to admin_coaches_url, notice: 'Тренер изменен'
    else
      render :new, notice: 'Ошибка при сохранении тренера'
    end
  end
  
  def destroy
    @coach.destroy
    redirect_to admin_coaches_url
  end
  
  protected
  
  def set_coach
    @coach = Coach.find(params[:id])
  end
end
