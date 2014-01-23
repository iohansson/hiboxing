# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.com" }
    password "pass"
    password_confirmation "pass"
    
    factory :invalid_user do
      email nil
    end
  end
end
