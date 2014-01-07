require 'spec_helper'

describe Photo do
  context "Validation" do
    it "validates title presence" do
      photo = FactoryGirl.build(:photo, title: nil)
      expect(photo).not_to be_valid
      expect(photo.errors[:title]).not_to be_nil
    end
  end
end
