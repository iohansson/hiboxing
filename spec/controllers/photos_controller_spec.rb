require 'spec_helper'

describe PhotosController do
  describe "index" do
    before do
      @photos = FactoryGirl.create_list(:photo, 25)
    end
    it "assigns photos" do
      get :index
      expect(assigns[:photos]).to eq @photos
    end
  end
end
