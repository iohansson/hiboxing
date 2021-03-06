require 'spec_helper'

describe Admin::GymsController do
  include LoginMacros

  let(:gym) { FactoryGirl.create(:gym) }
  render_views
  
  before do
    mock_geocoding!
    create_user_and_sign_in(true) #admin
    gym #lazy-create
  end
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => gym
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Gym.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Gym.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_gym_url(assigns[:gym]))
  end

  it "edit action should render edit template" do
    get :edit, :id => gym
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Gym.any_instance.stubs(:valid?).returns(false)
    put :update, :id => gym
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Gym.any_instance.stubs(:valid?).returns(true)
    put :update, :id => gym
    response.should redirect_to(admin_gym_url(assigns[:gym]))
  end

  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :id => gym
    response.should redirect_to(gyms_url)
    Gym.exists?(gym.id).should be_false
  end
end
