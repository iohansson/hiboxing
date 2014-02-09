require 'spec_helper'

describe Sub, sub: true do
  context "Calculated fields" do
    let(:group) { FactoryGirl.create(:group, num_trainings: 12, days: 30) }
    let(:sub) { FactoryGirl.build(:sub, group: group) }
    it "sets trainings_left according to group settings" do
      expect{sub.save}.to change{sub.trainings_left}.to(12)
      expect(sub.until_date.to_i).to eq((Time.now+30.days).to_i) 
    end
  end
  context "Gamification" do
    let(:sub) { FactoryGirl.create(:sub) }
    it "has points" do
      expect(sub).to respond_to(:points)
    end
  end
  context "Trainings" do
    let(:group) { FactoryGirl.create(:group) }
    let(:event_monday) { FactoryGirl.create(:event, group: group, day: 1) }
    let(:sub) { FactoryGirl.create(:sub, group: group) }
    it "calculates next training" do
      event_monday
      expect(sub.next_training).to eq(event_monday)
    end
  end
end
