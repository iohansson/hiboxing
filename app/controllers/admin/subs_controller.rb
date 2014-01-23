class Admin::SubsController < Admin::ApplicationController
  before_filter :set_sportsman

  def index
  end
  
  def new
    @sub = @sportsman.subs.new
  end
  
  def create
    @sub = @sportsman.subs.new(params[:sub])
    if @sub.save
      redirect_to edit_admin_sportsman_url(@sportsman)
    else
      render :new
    end
  end
  
  protected
  
  def set_sportsman
    @sportsman = Sportsman.find(params[:sportsman_id])
  end
end
