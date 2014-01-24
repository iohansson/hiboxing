class Admin::GroupsController < Admin::ApplicationController
  before_filter :set_group, only: [:destroy, :edit]
  
  def index
    @groups = Group.all
  end
  
  def new
    @group = Group.new
  end
  
  def edit
    @sportsmen = @group.sportsmen.active
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
    @group.destroy
    redirect_to admin_groups_url, notice: 'Группа удалена'
  end
  
  protected
  
  def set_group
    @group = Group.find(params[:id])
  end
end
