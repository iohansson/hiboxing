# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title "MyString"
    description "MyString"
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root,'/features/test_files/test.jpg')))
  end
end
