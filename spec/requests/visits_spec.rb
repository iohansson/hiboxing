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
      sub #i need that sub))
      click_link 'Группы'
      expect(current_path).to eq(admin_groups_path)
      click_link group.name
    end
    it "shows its active sportsmen" do
      expect(page).to have_content(active_sportsman.name)
    end
    it "does not show inactive sportsmen" do
      expect(page).not_to have_content(sportsman.name)
    end
    it "checks_in sportsman" do
      expect{
        within "#sub_#{sub.id}" do
          click_button 'Пришел'
        end
      }.to change{active_sportsman.visits.count}.by(1)
      expect(current_path).to eq(edit_admin_group_path(group))
    end
  end
end
