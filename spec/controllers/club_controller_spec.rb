require 'spec_helper'

describe ClubController do
  describe "get index" do
    it "should render index template" do
      get :index
      expect(response).to render_template(:index)
    end
    it "assigns 3 latest news" do
      get :index
      expect(assigns[:news_items]).to eq(NewsItem.order("updated_at").last(3))
    end
  end
end
