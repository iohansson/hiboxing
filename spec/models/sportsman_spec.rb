require 'spec_helper'

describe Sportsman do
  context "Validation" do
    let(:sportsman) { FactoryGirl.build(:sportsman) }
  
    it "should be valid" do
      expect(sportsman).to be_valid
    end
  end
  context "Association" do
    it "belongs to user" do
      expect(subject).to respond_to :user
    end
    it "has many subs" do
      expect(subject).to respond_to :subs
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
end
