class Admin::PhotosController < Admin::ApplicationController

  before_filter :set_photo, only: [:edit,:update,:destroy]
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end
  
  def edit
    render :new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to admin_photos_path, notice: 'Фото добавлено'
    else
      render :new, notice: 'Не удалось добавить фото'
    end
  end
  
  def update
    if @photo.update_attributes(params[:photo])
      redirect_to admin_photos_path, notice: 'Фото изменено'
    else
      render :new, notice: 'Не удалось сохранить изменения для фото'
    end
  end
  
  def destroy
    @photo.destroy
    redirect_to admin_photos_path
  end
  
  protected
  
  def set_photo
    @photo = Photo.find(params[:id])
  end
end
