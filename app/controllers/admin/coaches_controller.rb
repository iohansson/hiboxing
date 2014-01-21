class Admin::CoachesController < Admin::ApplicationController
  before_filter :authorize
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
      if params[:coach][:image].present?
        render :crop
      else
        redirect_to admin_coaches_url, notice: 'Тренер добавлен'
      end
    else
      render :new, notice: 'Ошибка при добавлении тренера'
    end
  end
  
  def update
    if @coach.update_attributes(params[:coach])
      if params[:coach][:image].present?
        render :crop
      else
        redirect_to admin_coaches_url, notice: 'Тренер изменен'
      end
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
