require 'spec_helper'

describe DashboardController do
  include LoginMacros
  describe "GET index" do
    context "not logged in" do
      it "redirects to login" do
        get :index
        expect(response).to redirect_to(login_url)
      end
    end
    context "logged in" do
      before do
        create_user_and_sign_in false
      end
      it "assigns user" do
        get :index
        expect(assigns[:user]).to be_a(User)
      end
    end
  end
end
