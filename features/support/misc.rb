def test_files_dir
  'features/test_files/'
end

def login
  u = FactoryGirl.create(:user)
  visit '/admin'
  fill_in 'Логин', with: u.name
  fill_in 'Пароль', with: "pass"
  click_button 'Войти'
end

def add_news_item(params)
  visit new_admin_news_item_path
  fill_in 'Заголовок', with: params[:title]
  fill_in 'Текст', with: "Текст новости"
  click_button 'Опубликовать'
end

def add_photo(file,title)
  visit new_photo_path
  fill_in 'Заголовок', with: title
  attach_file 'Файл', test_files_dir+file
  click_button 'Добавить'
end
