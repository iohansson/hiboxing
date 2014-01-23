module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end
  
  def unset_user_session
    session[:user_id] = nil
  end
  
  def sign_in(user)
    visit login_path
    fill_in 'Почта', with: user.email
    fill_in 'Пароль', with: "pass"
    click_button 'Войти'
  end
  
  def create_user(admin)
    User.find_by_email('specific@mail.com') || FactoryGirl.create(:user, email: 'specific@mail.com', admin: admin) || User.create(email: 'specific@mail.com', password: 'pass', password_confirmation: 'pass', admin: admin)
  end
  
  def create_user_and_sign_in(admin)
    set_user_session create_user(admin)
  end
  
  def create_user_and_sign_in_via_form(admin)
    sign_in create_user(admin)
  end
end
