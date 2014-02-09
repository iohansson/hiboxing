require 'spec_helper'

describe Sportsman do
  context "Validation" do
    let(:sportsman) { FactoryGirl.build(:sportsman) }
  
    it "should be valid" do
      expect(sportsman).to be_valid
    end
    it "must have a name" do
      sportsman.name = nil
      expect(sportsman).not_to be_valid
      expect(sportsman.errors[:name]).not_to be_nil
    end
    it "must have email" do
      sportsman.email = nil
      expect(sportsman).not_to be_valid
      expect(sportsman.errors[:email]).not_to be_nil
    end
  end
  context "Association" do
    it "has many subs" do
      expect(subject).to respond_to :subs
    end
    it "has active subs" do
      expect(subject).to respond_to :active_subs
    end
    it "has inactive subs" do
      expect(subject).to respond_to :inactive_subs
    end
  end
  context "Scoping" do
    before do
      group = FactoryGirl.create(:group)
      @active = FactoryGirl.create_list(:sportsman, 5).each do |s| 
        s.subs.create(group_id: group.id)
      end
      @inactive = FactoryGirl.create_list(:sportsman, 5).each do |s| 
        s.subs.create(group_id: group.id) 
        s.subs.last.update_attributes({ trainings_left: 0 })
      end
    end
    it "retrieves active" do
      expect(Sportsman.active).to eq(@active)
    end
    it "retrieves inactive" do
      expect(Sportsman.inactive).to eq(@inactive)
    end
  end
  context "Subs" do
    let(:sportsman) { FactoryGirl.create(:sportsman) }
    let(:group) { FactoryGirl.create(:group) }
    let(:sub) { FactoryGirl.create(:sub, sportsman: sportsman, group: group) }
    let(:sub_expired) { FactoryGirl.create(:sub_expired, sportsman: sportsman) }
    it "retrieves active subs" do
      sub
      expect(sportsman.active_subs).to eq([sub])
    end
    it "retrieves inactive subs" do
      sub_expired.until_date = 1.day.ago
      sub_expired.save
      expect(sportsman.inactive_subs).to eq([sub_expired])
    end
  end
end
