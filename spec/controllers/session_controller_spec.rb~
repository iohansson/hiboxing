require 'spec_helper'

describe SessionController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    before do
      @user = FactoryGirl.create(:user)
    end
    it "logs in with valid credentials" do
      post 'create', name: @user.name, password: "pass"
      expect(response).to redirect_to admin_url
    end
    it "does not login with invalid credentials" do
      post 'create', name: @user.name, password: "wrong"
      expect(response).to render_template('new') 
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
