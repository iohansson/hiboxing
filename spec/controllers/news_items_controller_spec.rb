require 'spec_helper'

describe NewsItemsController do
  describe "index" do
    before do
      @news = FactoryGirl.create_list(:news_item, 25)
    end
    it "assigns news items" do
      get :index
      expect(assigns[:news_items]).not_to be_nil
    end
    it "splits items by pages" do
      get :index, page: 1
      expect(assigns[:news_items]).to eq(NewsItem.order('updated_at DESC').first(10))
      get :index, page: 2
      expect(assigns[:news_items]).to eq(NewsItem.order('updated_at DESC').offset(10).first(10))
      get :index, page: 3
      expect(assigns[:news_items]).to eq(NewsItem.order('updated_at DESC').offset(20).first(10))
    end
  end
end
