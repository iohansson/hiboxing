require 'spec_helper'

describe Admin::PhotosController do
  include LoginMacros
  before :each do
    user = FactoryGirl.create(:user)
    set_user_session user
  end
  describe '#GET new' do
    it "responds with success" do
      get :new
      expect(response.status).to eq(200)
    end
    it "assigns photo" do
      get :new
      expect(assigns[:photo]).to be_a(Photo)
    end
  end
  describe "#POST create" do
    before do
      @photo = FactoryGirl.attributes_for(:photo)
    end
    it "redirects to photo index on success" do
      post :create, photo: @photo
      expect(response).to redirect_to admin_photos_path
    end
    it "creates a file in storage dir" do
      post :create, photo: @photo
      expect(File).to exist("#{Rails.root}/spec/support/uploads/photo/image/#{Photo.last.id}/test.jpg")
    end
    it "creates a thumb in storage dir" do
      post :create, photo: @photo
      expect(File).to exist("#{Rails.root}/spec/support/uploads/photo/image/#{Photo.last.id}/thumb_test.jpg")
    end
  end
  describe "#GET index" do
    it "assigns photos" do
      get :index
      expect(assigns[:photos]).to eq(Photo.all)
    end
  end
end
