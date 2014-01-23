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
end
