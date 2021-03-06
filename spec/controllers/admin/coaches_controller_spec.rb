require 'spec_helper'

describe Admin::CoachesController do
  include LoginMacros
  before do
    create_user_and_sign_in(true) #admin
  end
  describe 'GET index' do
    it "succeeds" do
      get :index
      expect(response.status).to eq(200)
    end
    it "assigns coaches" do
      get :index
      expect(assigns[:coaches]).to eq(Coach.all)
    end
    it "requires login" do
      unset_user_session
      get :index
      expect(response).to redirect_to(admin_login_url)
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
  describe 'GET edit' do
    it "finds and assigns coach" do
      coach = FactoryGirl.create(:coach)
      get :edit, id: coach.id
      expect(assigns[:coach]).to eq(coach)
    end
  end
  describe 'DELETE destroy' do
    it "redirects to index" do
      coach = FactoryGirl.create(:coach)
      delete :destroy, id: coach.id
      expect(response).to redirect_to(admin_coaches_url)
    end
  end
end
