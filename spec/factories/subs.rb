# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    sportsman
    group
    trainings_left 1
    until_date "2014-01-23"
  end
end
