def create_and_signin_user(password)
  user = create(:user)
  visit root_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: password
  click_button 'Sign in'
  user
end