require 'spec_helper'

describe Event do
  context "Validation" do
    it "creates event with valid params" do
      event = FactoryGirl.build(:event)
      expect{event.save}.to change{Event.count}.by(1)
    end
    it "correctly saves time" do
      event = FactoryGirl.create(:event, start: TimeOfDay.new(8))
      expect(event.start).to eq(TimeOfDay.new(8))
    end
  end
  context "Association" do
    it "has group" do
      expect(subject).to respond_to(:group)
    end
  end
  context "Validation" do
    it "does not overlap in time" do
    end
    it "has group" do
      event = FactoryGirl.build(:event, group: nil)
      expect(event).not_to be_valid
      expect(event.errors[:group]).not_to be_nil
    end
  end
  context "Scoping" do
    it "returns event for a specified time" do
      day = Time.now.wday
      day = 7 if day == 0
      (8..22).each do |hour|
        FactoryGirl.create(:event, day: day, start: TimeOfDay.new(hour), stop: TimeOfDay.new(hour+1))
      end
      expect(Event.current).to eq(Event.where('day = :day AND start <= :time AND stop >= :time',{day: day, time: Time.now.to_time_of_day.to_s}))
    end
    it "returns next event" do
      day = Time.now.wday
      day = 7 if day == 0
      (8..22).each do |hour|
        FactoryGirl.create(:event, day: day, start: TimeOfDay.new(hour), stop: TimeOfDay.new(hour+1))
      end
      expect(Event.next).to eq(Event.where('day = :day AND start >= :time',{day: day, time: Time.now.to_time_of_day.to_s}).order(:start).first)
    end
  end
end
