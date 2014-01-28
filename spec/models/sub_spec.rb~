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
end
