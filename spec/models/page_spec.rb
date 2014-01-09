require 'spec_helper'

describe Page do
  context "Validation" do
    subject { FactoryGirl.build(:page) }
    %w(title content).each do |attr|
      it "must have #{attr}" do
        subject.send("#{attr}=",nil)
        expect(subject).not_to be_valid
        expect(subject.errors[attr]).not_to be_nil
      end
    end
  end
end
