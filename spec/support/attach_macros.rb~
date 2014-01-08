module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end
  
  def sign_in(user)
    visit login_path
    fill_in 'Логин', with: user.name
    fill_in 'Пароль', with: "pass"
    click_button 'Войти'
  end
end
