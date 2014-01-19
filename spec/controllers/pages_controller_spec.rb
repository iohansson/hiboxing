require 'spec_helper'

describe PagesController do
  describe "GET about" do
    it "renders about" do
      get :about
      expect(response).to render_template(:about)
    end
  end
  
  describe "GET school" do
    it "renders school" do
      get :school
      expect(response).to render_template(:school)
    end
  end
end
