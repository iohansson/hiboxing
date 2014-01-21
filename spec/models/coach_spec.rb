require 'spec_helper'

describe Coach do
  context "Validation" do
    subject { FactoryGirl.build(:coach) }
    it "must have name" do
      subject.name = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).not_to be_nil
    end
  end
  context "Cropping avatar" do
    it "has crop parameters" do
      expect(subject).to respond_to(:crop_x)
    end
    it "calls crop_image after update if has crop params" do
      coach = FactoryGirl.create(:coach)
      coach.crop_x = 0
      expect(coach).to receive(:crop_image)
      coach.save
    end
  end
end
