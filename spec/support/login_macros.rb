module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end
  def set_sportsman_session(sportsman)
    session[:sportsman_id] = sportsman.id
    sportsman
  end
  
  def unset_user_session
    session[:user_id] = nil
  end
  
  def unset_sportsman_session
    session[:sportsman_id] = nil
  end
  
  def sign_in_user(user)
    visit admin_login_path
    fill_in 'Почта', with: user.email
    fill_in 'Пароль', with: "pass"
    click_button 'Войти'
  end
  
  def sign_in_sportsman(sportsman)
    visit login_path
    fill_in 'Почта', with: sportsman.email
    fill_in 'Пароль', with: "pass"
    click_button 'Войти'
  end
  
  def create_user(admin)
    User.find_by_email('specific@mail.com') || FactoryGirl.create(:user, email: 'specific@mail.com', admin: admin) || User.create(email: 'specific@mail.com', password: 'pass', password_confirmation: 'pass', admin: admin)
  end
  def create_sportsman
    Sportsman.find_by_email('balboa@balboa.com') || FactoryGirl.create(:sportsman, email: 'balboa@balboa.com') || Sportsman.create(email: 'balboa@balboa.com', password: 'pass', password_confirmation: 'pass', name: 'Balboa')
  end
  
  def create_user_and_sign_in(admin)
    set_user_session create_user(admin)
  end
  
  def create_sportsman_and_sign_in
    set_sportsman_session create_sportsman
  end
  
  def create_user_and_sign_in_via_form(admin)
    sign_in_user create_user(admin)
  end
  
  def require_admin_login
    unset_user_session
    get :index
    expect(response).to redirect_to(admin_login_url)
  end
  
  def require_sportsman_login
    unset_sportsman_session
    get :index
    expect(response).to redirect_to(login_url)
  end
end
