# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sportsman do
    name "MyString"
    phone "MyString"
    password "pass"
    password_confirmation "pass"
    sequence(:email) {|n| "e#{n}@mail.com"}
    
    factory :sportsman_invalid do
      name nil
    end
  end
end
