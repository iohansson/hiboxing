# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :coach do
    name "MyString"
    description "MyText"
    image { File.new(Rails.root.join('spec','files','adriana.jpg')) }
    
    factory :invalid_coach do
      name nil
    end
  end
end
