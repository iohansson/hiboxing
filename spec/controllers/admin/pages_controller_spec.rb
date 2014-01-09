require 'spec_helper'

describe Admin::PagesController do
  describe "GET index" do
    it "assigns pages" do
      get :index
      expect(assigns[:pages]).to eq(Page.all)
    end
  end
  
  describe "GET new" do
    it "assigns page" do
      get :new
      expect(assigns[:page]).to be_a(Page)
    end
  end
  
  describe "GET create" do
    before do
      @page = FactoryGirl.attributes_for(:page)
      @invalid_page = FactoryGirl.attributes_for(:invalid_page)
    end
    it "redirects to index on success" do
      post :create, page: @page
      expect(response).to redirect_to admin_pages_url
    end
    it "renders form when fail" do
      post :create, page: @invalid_page
      expect(response).to render_template(:new)
    end
  end
end
