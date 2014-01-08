class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.page(params[:page]).order('updated_at DESC')
  end
end
