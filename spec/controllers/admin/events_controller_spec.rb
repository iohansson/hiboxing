require 'spec_helper'

describe Admin::EventsController do
  include LoginMacros
  before do
    create_user_and_sign_in(true)
  end
  describe "GET index" do
    it "assigns events" do
      get :index
      expect(assigns[:events]).to eq(Event.all)
    end
    it "assigns groups" do
      get :index
      expect(assigns[:groups]).to eq(Group.all)
    end
  end
  describe "POST create" do
    before do
      @group = FactoryGirl.create(:group)
    end
    it "creates event" do
      xhr :post, :create, event: { group_id: @group.id, day: 7, start: 540, duration: 60 }
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["id"]).to eq("#event-#{Event.last.id}-7-540-60-#{@group.id}") 
    end
  end
  describe "DELETE destroy" do
    it "deletes event" do
      e = FactoryGirl.create(:event)
      expect{xhr :delete, :destroy, id: e.id}.to change{Event.count}.by(-1)
    end
  end
  describe "PUT update" do
    it "returns new id for event" do
    end
  end
end
