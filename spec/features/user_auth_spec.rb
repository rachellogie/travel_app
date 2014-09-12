require 'spec_helper'

feature 'user auth' do

  TEST_PASS = 'password'

  it 'user can register' do
    visit root_path
    click_on 'Register'
    fill_in 'Email', with: 'david@example.com'
    fill_in 'Password', with: TEST_PASS
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'You have signed up successfully.'
  end

  it 'user can log in' do
    user = create(:user)
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: TEST_PASS
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  it 'user can log out' do
    create_and_login_user
    visit root_path
    click_link 'Log out'
    expect(page).to have_content 'Signed out successfully.'
  end
end