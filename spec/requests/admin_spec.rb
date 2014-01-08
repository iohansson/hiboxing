describe "news management" do
  include LoginMacros
  before :each do
    user = FactoryGirl.create(:user)
    sign_in user
  end
  
  it "adds a news item" do
    click_link "Новости"
    expect(current_path).to eq(admin_news_items_path)
    expect{
      click_link 'Добавить новость'
      fill_in 'Заголовок', with: 'Прекрасная новость!'
      fill_in 'Текст', with: 'Лорем ипсум дот амет'
      click_button 'Опубликовать'
    }.to change{NewsItem.count}.by(1)
    expect(current_path).to eq(admin_news_items_path)
    expect(page).to have_content('Прекрасная новость!')
  end
end