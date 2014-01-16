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
end
