require 'spec_helper'
include LoginMacros

describe Admin::UsersController do
  
  before do
    create_user_and_sign_in(true)
  end
  
  describe "GET new" do
    it "assigns user" do
      get :new
      expect(assigns[:user]).to be_a(User)
    end
  end
  
  describe "POST create" do
    before do
      @valid_user = FactoryGirl.attributes_for(:user, email: 'unique@mail.com')
    end
    it "redirects to index on success" do
      post :create, user: @valid_user
      expect(response).to redirect_to(admin_users_url)
    end
  end
  
  describe "GET index" do
    it "assigns users" do
      get :index
      expect(assigns[:users]).to eq(User.all)
    end
  end
  
  %w(new index).each do |action|
    it "redirects to log in from #{action} when not authenticated" do
      unset_user_session
      get action.to_sym
      expect(response).to redirect_to admin_login_url
    end
  end
  
end
