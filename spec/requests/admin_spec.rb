include LoginMacros
include AttachMacros

describe "administration" do
  before do
    user = User.find_by_name('specific')
    if !user
      user = FactoryGirl.create(:user, name: 'specific')
    end
    sign_in user
  end

  describe "news management" do
    it "adds a news item" do
      click_link 'Новости'
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
    
    it "edits a news item" do
      news_item = FactoryGirl.create(:news_item, title: 'Новость')
      click_link 'Новости'
      expect(current_path).to eq(admin_news_items_path)
      expect{
        within "div#news_item_#{news_item.id}" do
          click_link 'Редактировать'
        end
        fill_in 'Заголовок', with: 'Отредактировано'
        click_button 'Опубликовать'
      }.to change{NewsItem.find(news_item.id).title}.from('Новость').to('Отредактировано')
      expect(current_path).to eq(admin_news_items_path)
      expect(page).to have_content('Отредактировано')
    end
    
    it "deletes a news item" do
      news_item = FactoryGirl.create(:news_item, title: 'Удали меня')
      click_link 'Новости'
      expect(current_path).to eq(admin_news_items_path)
      expect{
        within "div#news_item_#{news_item.id}" do
          click_link 'Удалить'
        end
      }.to change{NewsItem.count}.by(-1)
      expect(current_path).to eq(admin_news_items_path)
      expect(page).not_to have_content('Удали меня')
    end
  end

  describe "photo management" do
    it "adds a photo" do
      click_link 'Фото'
      expect(current_path).to eq(admin_photos_path)
      expect{
        click_link 'Добавить фото'
        fill_in 'Заголовок', with: 'Прекрасное фото!'
        attach_file 'Файл', test_files_dir+"test.jpg"
        click_button 'Сохранить'
      }.to change{Photo.count}.by(1)
      expect(current_path).to eq(admin_photos_path)
      expect(find('img')[:src]).to include(Photo.last.image.thumb.url)
    end
    it "edits a photo" do
      photo = FactoryGirl.create(:photo, title: 'Не то')
      click_link 'Фото'
      expect(current_path).to eq(admin_photos_path)
      expect{
        within "div#photo_#{photo.id}" do
          click_link 'Редактировать'
        end
        fill_in 'Заголовок', with: 'То'
        click_button 'Сохранить'
      }.to change{Photo.find(photo.id).title}.from('Не то').to('То')
      expect(current_path).to eq(admin_photos_path)
      expect(find('img')[:alt]).to include('То')
    end
    it "deletes a photo" do
      photo = FactoryGirl.create(:photo, title: 'Удали меня')
      click_link 'Фото'
      expect(current_path).to eq(admin_photos_path)
      expect{
        within "div#photo_#{photo.id}" do
          click_link 'Удалить'
        end
      }.to change{Photo.count}.by(-1)
      expect(current_path).to eq(admin_photos_path)
    end
  end
  
  describe "user management" do
    it "adds user" do
      click_link 'Пользователи'
      expect(current_path).to eq(admin_users_path)
      expect{
        click_link 'Добавить пользователя'
        fill_in 'Логин', with: 'iohansson'
        fill_in 'Пароль', with: 'secret'
        fill_in 'Пароль еще раз', with: 'secret'
        click_button 'Сохранить'
      }.to change{User.count}.by(1)
      expect(current_path).to eq(admin_users_path)
      expect(page).to have_content('iohansson')
    end
    it "edits user" do
      user = FactoryGirl.create(:user, name: 'Edit me')
      click_link 'Пользователи'
      expect(current_path).to eq(admin_users_path)
      expect{
        within "div#user_#{user.id}" do
          click_link 'Редактировать'
        end
        fill_in 'Пароль', with: 'new'
        fill_in 'Пароль еще раз', with: 'new'
        click_button 'Сохранить'
      }.to change{User.find(user.id).password_digest}
      expect(current_path).to eq(admin_users_path)
    end
  end
  
  describe "static pages management" do
    it "adds page" do
      click_link 'Страницы'
      expect(current_path).to eq(admin_pages_path)
      expect{
        click_link 'Добавить страницу'
        fill_in 'Заголовок', with: 'О клубе'
        fill_in 'Содержание', with: '<b>Хорошо!</b>'
        fill_in 'Порядок', with: 1
        check 'Опубликована'
        click_button 'Сохранить'
      }.to change{Page.count}.by(1)
      expect(current_path).to eq(admin_pages_path)
      expect(page).to have_content('О клубе')
    end
  end
  
  describe "group management" do
    
  end
end
