require 'spec_helper'

describe Admin::SportsmenController do
  include LoginMacros
  render_views

  let(:sportsman) { FactoryGirl.create(:sportsman) }

  before do
    create_user_and_sign_in(true) #admin
    sportsman #lazy-create
  end
  
  it "requires login" do
    require_admin_login
  end
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => sportsman
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Sportsman.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Sportsman.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_sportsmen_url)
  end

  it "edit action should render edit template" do
    get :edit, :id => sportsman
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Sportsman.any_instance.stubs(:valid?).returns(false)
    put :update, :id => sportsman
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Sportsman.any_instance.stubs(:valid?).returns(true)
    put :update, :id => sportsman
    response.should redirect_to(admin_sportsmen_url)
  end

  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :id => sportsman
    response.should redirect_to(admin_sportsmen_url)
    Sportsman.exists?(sportsman.id).should be_false
  end
end
