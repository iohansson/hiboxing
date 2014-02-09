require 'spec_helper'

include DomHelper
include LoginMacros

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
        expect(current_path).to eq(new_sportsman_path)
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
        expect(current_path).to eq(edit_sportsman_path(Sportsman.last))
        expect(page).to have_content('Олег Бочагов')
      end
    end
  end
  describe "Dashboard" do
    context "subs" do
      before do
        @sportsman = FactoryGirl.create(:sportsman)
        @group = FactoryGirl.create(:group)
        @sub = FactoryGirl.create(:sub, sportsman: @sportsman, group: @group)
        @event = FactoryGirl.create(:event, group: @group)
        @visit = FactoryGirl.create(:visit, sub: @sub)
        sign_in_sportsman(@sportsman)
      end
      it "shows active" do
        expect(current_path).to eq(edit_sportsman_path(@sportsman))
        expect(page).to have_content(@group.name)
        expect(page).to have_content(@sub.trainings_left)
        expect(page).to have_content(@sub.next_training.closest_date)
      end
    end
  end
end
