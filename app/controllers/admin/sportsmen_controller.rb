class Admin::SportsmenController < Admin::ApplicationController
  def index
    @sportsmen = Sportsman.all
  end

  def show
    @sportsman = Sportsman.find(params[:id])
  end

  def new
    @sportsman = Sportsman.new
  end

  def create
    @sportsman = Sportsman.new(params[:sportsman])
    if @sportsman.save
      redirect_to admin_sportsmen_url, :notice => "Спортсмен добавлен"
    else
      render :action => 'new'
    end
  end

  def edit
    @sportsman = Sportsman.find(params[:id])
  end

  def update
    @sportsman = Sportsman.find(params[:id])
    if @sportsman.update_attributes(params[:sportsman])
      redirect_to admin_sportsmen_url, :notice => "Спортсмен изменен"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sportsman = Sportsman.find(params[:id])
    @sportsman.destroy
    redirect_to admin_sportsmen_url, :notice => "Спортсмен удален"
  end
end
