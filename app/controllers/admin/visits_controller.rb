class Admin::VisitsController < Admin::ApplicationController
  before_filter :set_sub
  
  def create
    @visit = @sub.visits.new
    if @visit.save
      redirect_to edit_admin_group_url(@sub.group), notice: 'ОК'
    else
      redirect_to edit_admin_group_url(@sub.group), notice: 'Не ОК'
    end
  end
  
  protected
  
  def set_sub
    @sub = Sub.find(params[:sub_id])
  end
end
