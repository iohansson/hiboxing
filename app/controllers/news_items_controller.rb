class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.all
  end
  
  def new
    @news_item = NewsItem.new
  end
  
  def create
    @news_item = NewsItem.new(params[:news_item])
    if @news_item.save
      redirect_to news_items_path
    else
      render :new
    end
  end
end
