require 'spec_helper'

describe Admin::AdminController do
  
  include LoginMacros
  
  describe "GET 'index'" do
    it "redirects to login when unauthorized" do
      get 'index'
      expect(response).to redirect_to login_url
    end
    it "accesses when user logs in" do
      u = FactoryGirl.create(:user)
      set_user_session(u)
      
      get 'index'
      expect(response).to be_success
    end
  end

end
