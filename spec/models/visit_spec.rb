require 'spec_helper'

describe Visit do
  let(:sub) { FactoryGirl.create(:sub) }
  
  it "should be valid" do
    expect(sub.visits.new).to be_valid
  end
end
