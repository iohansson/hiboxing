require 'spec_helper'

describe SportsmenController do
  include LoginMacros
  describe "GET edit" do
    let(:sportsman) { FactoryGirl.create(:sportsman) }
    context "not logged in" do
      it "redirects to login" do
        sportsman
        get :edit, id: sportsman.id
        expect(response).to redirect_to(login_url)
      end
    end
    context "logged in" do
      before do
        @sportsman = create_sportsman_and_sign_in
      end
      it "assigns sportsman" do
        get :edit, id: @sportsman
        expect(assigns[:sportsman]).to be_a(Sportsman)
      end
    end
  end
  describe "GET show" do
    let(:sportsman) { FactoryGirl.create(:sportsman) }
    it "shows public profile" do
      sportsman
      get :show, id: sportsman.id
      expect(assigns[:sportsman]).to be_a(Sportsman)
    end
  end
  describe "POST create" do
    it "creates sportsman with valid attributes" do
      @params = FactoryGirl.attributes_for(:sportsman)
      expect{
        post :create, sportsman: @params
      }.to change{Sportsman.count}.by(1)
      expect(response).to redirect_to(edit_sportsman_path(Sportsman.last))
    end
    it "renders new on fail" do
      @params = FactoryGirl.attributes_for(:sportsman_invalid)
      post :create, sportsman: @params
      expect(response).to render_template(:new)
    end
  end
  describe "GET new" do
    it "assigns sportsman" do
      get :new
      expect(assigns[:sportsman]).to be_a(Sportsman)
    end
  end
end
