# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    group
    day 1
    start TimeOfDay.new 8
    stop TimeOfDay.new 10
  end
end
