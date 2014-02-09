# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    sportsman
    group
    trainings_left 1
    until_date 1.month.from_now
    
    factory :sub_expired do
      until_date 1.day.ago
    end
  end
end
