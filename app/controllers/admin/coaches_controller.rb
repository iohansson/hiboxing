class Admin::CoachesController < ApplicationController
  def index
    @coaches = Coach.all
  end
  
  def new
    @coach = Coach.new
  end
  
  def create
    @coach = Coach.new(params[:coach])
    if @coach.save
      redirect_to admin_coaches_url, notice: 'Тренер добавлен'
    else
      render :new, notice: 'Ошибка при добавлении тренера'
    end
  end
end
