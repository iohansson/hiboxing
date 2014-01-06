class ClubController < ApplicationController
  def index
    @news_items = NewsItem.order(:updated_at).last(3)
  end
end
