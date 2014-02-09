require 'spec_helper'

describe Admin::SessionController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    before do
      @user = User.find_by_email('specific@mail.com')
      if !@user
        @user = FactoryGirl.create(:user, email: 'specific@mail.com')
      end
    end
    it "logs in with valid credentials" do
      post 'create', email: @user.email, password: "pass"
      expect(response).to redirect_to admin_url
    end
    it "does not login with invalid credentials" do
      post 'create', email: @user.email, password: "wrong"
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
