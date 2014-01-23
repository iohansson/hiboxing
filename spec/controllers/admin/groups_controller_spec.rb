require 'spec_helper'

describe Admin::GroupsController do
  include LoginMacros
  before do
    create_user_and_sign_in(true)
  end
  describe "GET index" do
    it "assigns groups" do
      get :index
      expect(assigns[:groups]).to eq(Group.all)
    end
    it "redirects to login when unauthorized" do
      unset_user_session
      get :index
      expect(response).to redirect_to(login_url)
    end
  end
  
  describe "GET new" do
    it "assigns group" do
      get :new
      expect(assigns[:group]).to be_a(Group)
    end
  end
  
  describe "POST create" do
    before do
      @group = FactoryGirl.attributes_for(:group)
    end
    it "redirects to index on success" do
      post :create, group: @group
      expect(response).to redirect_to admin_groups_url
    end
  end
  
  describe "DELETE destroy" do
    before do
      @group = FactoryGirl.create(:group)
    end
    it "redirects to index after destroying" do
      delete :destroy, id: @group.id
      expect(response).to redirect_to(admin_groups_url)
    end
  end
end
