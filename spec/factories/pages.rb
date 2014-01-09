# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title "MyString"
    content "MyText"
    sort_order 1
    is_published false
    
    factory :invalid_page do
      title nil
    end
  end
end
