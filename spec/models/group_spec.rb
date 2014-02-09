require 'spec_helper'

describe Group do
  context "Validation" do
    subject { FactoryGirl.build(:group, name: 'unique') }
    it "must have unique name" do
      subject.name = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).not_to be_nil
      subject.name = 'unique'
      expect(subject).to be_valid
      FactoryGirl.create(:group, name: 'unique')
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).not_to be_nil
    end
    %w[num_trainings days].each do |attr|
      it "must have #{attr}" do
        subject.send("#{attr}=",nil)
        expect(subject).not_to be_valid
        expect(subject.errors[attr]).not_to be_nil
      end
    end  
  end
  context "Associations" do
    it "has events" do
      expect(subject).to respond_to(:events)
    end
  end
  context "price" do
    subject { FactoryGirl.build(:group) }
    it "returns 'free' if price not specified" do
      subject.price = nil
      expect(subject.price).to eq('Бесплатно')
      subject.price = 1200
      expect(subject.price).to eq(1200)
    end
  end
  context "sportsmen" do
    let(:group) { FactoryGirl.create(:group) }
    let(:sportsman) { FactoryGirl.create(:sportsman) }
    let(:sub) { FactoryGirl.create(:sub, group: group, sportsman: sportsman) }
    it "has sportsmen" do
      expect(subject).to respond_to(:sportsmen)
    end
    it "retrieves active sportsmen" do
      sub
      expect(group.active_subs_with_sportsmen).to eq([sub])
    end
  end
end
