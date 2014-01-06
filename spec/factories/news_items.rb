# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_item do
    title "MyString"
    text "MyString"
    
    factory :invalid_news_item do
      title nil
    end
  end
end
