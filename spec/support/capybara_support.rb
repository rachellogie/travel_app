def create_and_login_user
  user = create(:user)
  visit root_path
  click_link 'Log in'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: 'password'
  click_button 'Log in'
end