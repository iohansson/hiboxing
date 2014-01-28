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
    it "assigns photos" do
      get :index
      expect(assigns[:photos]).to eq(Photo.all)
    end
    it "assigns events" do
      get :index
      expect(assigns[:events]).to eq(Event.all)
    end
    it "assigns contacts" do
      get :index
      expect(assigns[:contacts]).to eq(Gym.last)
    end
    it "assigns coaches" do
      get :index
      expect(assigns[:coaches]).to eq(Coach.all)
    end
  end
end
