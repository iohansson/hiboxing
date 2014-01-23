# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "Group#{n}" }
    num_trainings 12
    days 30
  end
end
