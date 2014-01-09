require 'spec_helper'

describe Admin::NewsItemsController do
  include LoginMacros
  before do
    user = FactoryGirl.create(:user)
    set_user_session user
  end
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
      expect(response).to redirect_to(admin_news_items_path)
    end
  end
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
