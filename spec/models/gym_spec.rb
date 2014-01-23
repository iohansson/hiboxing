require File.dirname(__FILE__) + '/../spec_helper'

describe Gym do
  context "Validation" do
    before do
      mock_geocoding!
    end
    subject { FactoryGirl.build(:gym) }
    %w(name address phone).each do |attr|
      it "should have #{attr}" do
        subject.send("#{attr}=",nil)
        expect(subject).not_to be_valid
        expect(subject.errors[attr]).not_to be_nil
      end
    end
  end
  context "Association" do
    it "has images" do
      expect(subject).to respond_to(:images)
    end
  end
  context "Geocoding" do
    let(:gym) { FactoryGirl.create(:gym) }
  
    it "geocodes address" do
      mock_geocoding!
      expect(gym.latitude).not_to be_nil
      expect(gym.longitude).not_to be_nil
    end
  end
end
