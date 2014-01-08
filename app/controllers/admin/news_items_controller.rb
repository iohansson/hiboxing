class Admin::NewsItemsController < ApplicationController
  before_filter :authorize
  def index
    @news_items = NewsItem.page(params[:page]).order('updated_at DESC')
  end
  
  def new
    @news_item = NewsItem.new
  end
  
  def create
    @news_item = NewsItem.new(params[:news_item])
    if @news_item.save
      redirect_to admin_news_items_path
    else
      render :new
    end
  end
end