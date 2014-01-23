class Admin::GroupsController < Admin::ApplicationController
  before_filter :authorize
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to admin_groups_url, notice: 'Группа добавлена'
    else
      render :new, notice: 'Не удалось добавить группу'
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to admin_groups_url, notice: 'Группа удалена'
  end
end
