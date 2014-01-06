def log_in
  FactoryGirl.create(:user, name: 'admin', password: 'admin', password_confirmation: 'admin')
  visit '/admin'
  fill_in 'Логин', with: 'admin'
  fill_in 'Пароль', with: 'admin'
  click_button 'Войти'
end

def add_news_item(params)
  visit new_news_item_path
  fill_in 'Заголовок', with: params[:title]
  fill_in 'Текст', with: "Текст новости"
  click_button 'Опубликовать'
end
