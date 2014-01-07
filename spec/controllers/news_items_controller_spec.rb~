require 'spec_helper'

describe NewsItemsController do
  describe "new" do
    it "assigns new news" do
      get :new
      expect(assigns[:news_item]).to be_a(NewsItem)
    end
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe "create" do
    before do
      @valid_attrs = FactoryGirl.attributes_for(:news_item)
      @invalid_attrs = FactoryGirl.attributes_for(:invalid_news_item)
    end
    it "redirects to index on success" do
      post :create, news_item: @valid_attrs
      expect(response).to redirect_to(news_items_path)
    end
  end
  describe "index" do
    it "assigns news items" do
      get :index
      expect(assigns[:news_items]).not_to be_nil
    end
  end
end
