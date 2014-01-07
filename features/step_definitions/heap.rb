Given(/^I have following news:$/) do |table|
  table.hashes.each do |news_item|
    n = NewsItem.create(news_item)
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
