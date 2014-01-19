class Admin::GymsController < Admin::ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.find(params[:id])
  end

  def new
    @gym = Gym.new
  end

  def create
    @gym = Gym.new(params[:gym])
    if @gym.save
      redirect_to admin_gym_path(@gym), :notice => "Successfully created gym."
    else
      render :action => 'new'
    end
  end

  def edit
    @gym = Gym.find(params[:id])
  end

  def update
    @gym = Gym.find(params[:id])
    if @gym.update_attributes(params[:gym])
      redirect_to admin_gym_path(@gym), :notice  => "Successfully updated gym."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gym = Gym.find(params[:id])
    @gym.destroy
    redirect_to gyms_url, :notice => "Successfully destroyed gym."
  end
end
