require 'spec_helper'

include DomHelper

describe "Sportsmen", focus: true do
  describe "Sign-up and log-in" do
    context "not logged in" do
      before do
        visit '/'
      end
      it "signs up" do
        click_link 'Мой клуб'
        expect(current_path).to eq(login_path)
        click_link 'Регистрация'
        expect{
          within register_form do
            fill_in 'Почта', with: 'w.iohansson@gmail.com'
            fill_in 'Пароль', with: 'pass'
            fill_in 'Пароль еще раз', with: 'pass'
            fill_in 'Имя', with: 'Олег Бочагов'
            fill_in 'Телефон', with: '+7(962)8767884'
            click_button 'Вперед!'
          end
        }.to change{Sportsman.count}.by(1)
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Олег Бочагов')
      end
    end
  end
end
