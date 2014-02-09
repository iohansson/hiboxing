require 'spec_helper'

describe Admin::VisitsController do
  include LoginMacros
  let(:sub) { FactoryGirl.create(:sub) }
  
  before do
    create_user_and_sign_in true
  end
  
  describe "POST create" do
    it "redirects to group page on success" do
      controller.request.expects(:referer).returns(edit_admin_group_url(sub.group))
      post :create, sportsman_id: sub.sportsman.id, sub_id: sub.id
      expect(response).to redirect_to edit_admin_group_url(sub.group)
    end 
  end
end
