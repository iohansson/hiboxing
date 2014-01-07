Given(/^I have following news:$/) do |table|
  table.hashes.each do |news_item|
    NewsItem.create(news_item)
  end
end

When(/^I go to the home page$/) do
  visit '/'
end

Then(/^I should see (\d+) latest news$/) do |n|
  NewsItem.order('updated_at').last(n.to_i).each do |news_item|
    expect(page).to have_content(news_item.title)
  end
end

When(/^admin adds a new "(.*?)"$/) do |title|
  add_news_item(title: title)
end

Then(/^I should see "(.*?)" on club index page$/) do |title|
  visit '/'
  expect(page).to have_content(title)
end

When(/^I go to the news index page$/) do
  visit '/news_items'
end

Then(/^I should see all news separated by pages$/) do
  NewsItem.order('updated_at').last(10).each do |news_item|
    expect(page).to have_content(news_item.title)
  end
end

Given(/^I have following photos:$/) do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |photo|
    Photo.create(photo)
  end
end

Then(/^I should see (\d+) latest photos$/) do |n|
  Photo.last(n.to_i).each do |photo|
    expect(page).to have_xpath("//img[@alt=\"#{photo.title}\"]") 
  end
end
When(/^I add image "(.*?)" with title "(.*?)"$/) do |file, title|
  add_photo(file,title)
end

Then(/^I should see image "(.*?)" with title "(.*?)" on the home page$/) do |file, title|
  visit '/'
  expect(find("img")[:src]).to have_content(file)
end
