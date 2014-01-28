class ClubController < ApplicationController
  def index
    @news_items = NewsItem.order(:updated_at).last(3)
    @photos = Photo.all
    @events = Event.all
    @contacts = Gym.last
    @coaches = Coach.all
  end
end
