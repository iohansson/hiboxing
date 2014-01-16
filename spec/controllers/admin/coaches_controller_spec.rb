require 'spec_helper'

describe Admin::CoachesController do
  describe 'GET index' do
    it "succeeds" do
      get :index
      expect(response.status).to eq(200)
    end
    it "assigns coaches" do
      get :index
      expect(assigns[:coaches]).to eq(Coach.all)
    end
  end
  describe 'GET new' do
    it "renders new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns coach" do
      get :new
      expect(assigns[:coach]).to be_a(Coach)
    end
  end
  describe 'POST create' do
    before do
      @valid = FactoryGirl.attributes_for(:coach)
      @invalid = FactoryGirl.attributes_for(:invalid_coach)
    end
    it "redirects to index on success" do
      post :create, coach: @valid
      expect(response).to redirect_to(admin_coaches_url)
    end
    it "renders new when fail" do
      post :create, coach: @invalid
      expect(response).to render_template(:new)
    end
  end
end
