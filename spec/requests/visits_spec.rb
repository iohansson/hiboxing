require 'spec_helper'

describe "visits" do
  include LoginMacros
  let(:group) { FactoryGirl.create(:group, name: "VIP") }
  let(:active_sportsman) { FactoryGirl.create(:sportsman, name: "Adriana Lima") }
  let(:sportsman) { FactoryGirl.create(:sportsman, name: "Hulk Hogan") }
  let(:sub) { FactoryGirl.create(:sub, sportsman: active_sportsman, group: group) }
  
  before do
    create_user_and_sign_in_via_form true #admin
  end
  
  describe "group page" do
    before do
      group #i need that group))
      click_link 'Группы'
      expect(current_path).to eq(admin_groups_path)
    end
    it "shows its active sportsmen" do
      sub
      click_link group.name
      expect(page).to have_content(active_sportsman.name)
    end
    it "does not show inactive sportsmen" do
      sub
      click_link group.name
      expect(page).not_to have_content(sportsman.name)
    end
  end
end
