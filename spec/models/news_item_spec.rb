require 'spec_helper'

describe NewsItem do
  context "Validation" do
    subject { FactoryGirl.build(:news_item) }
    
    %w(title text).each do |attr|
      it "should have #{attr}" do
        subject.send("#{attr}=",nil)
        expect(subject).not_to be_valid
        expect(subject.errors[attr]).not_to be_nil
      end
    end
  end
end
