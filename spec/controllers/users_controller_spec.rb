require 'spec_helper'

describe UsersController do
  describe "POST create" do
    it "creates user and sportsman with valid attributes" do
      @params = FactoryGirl.attributes_for(:user).merge({ sportsman_attributes: FactoryGirl.attributes_for(:sportsman, user: nil) })
      expect{
        post :create, user: @params
      }.to change{User.count}.by(1)
      expect(response).to redirect_to(dashboard_path)
    end
    it "signs user in" do
    end
    it "redirects to dashboard" do
    end
  end
  
  describe "GET new" do
    it "assigns user" do
      get :new
      expect(assigns[:user]).to be_a(User)
    end
  end
end
