class Admin::NewsItemsController < ApplicationController
  before_filter :authorize
  before_filter :set_news_item, only: [:edit, :update, :destroy]
  def index
    @news_items = NewsItem.page(params[:page]).order('updated_at DESC')
  end
  
  def new
    @news_item = NewsItem.new
  end
  
  def edit
    render :new
  end
  
  def create
    @news_item = NewsItem.new(params[:news_item])
    if @news_item.save
      redirect_to admin_news_items_path
    else
      render :new
    end
  end
  
  def update
    if @news_item.update_attributes(params[:news_item])
      redirect_to admin_news_items_path, notice: 'Новость успешно обновлена'
    else
      render :new, notice: 'Не удалось обновить новость'
    end
  end
  
  def destroy
    @news_item.destroy
    redirect_to admin_news_items_path, notice: 'Вы удалили новость'
  end
  
  protected
  
  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end
end
