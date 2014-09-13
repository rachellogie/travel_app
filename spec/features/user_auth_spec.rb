require 'spec_helper'

feature 'user auth' do

  scenario 'user can register' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'david@example.com'
    fill_in 'Password', with: ENV['TEST_PASS']
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'You have signed up successfully.'
  end

  scenario 'user can sign in' do
    user = create(:user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: ENV['TEST_PASS']
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'user can sign out' do
    create_and_signin_user(ENV['TEST_PASS'])
    visit root_path
    click_link 'Sign out'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Sign in'

  end

  scenario 'user must sign in before being allowed to do anything' do
    visit root_path
    expect(page).to_not have_content 'Places I want to go'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'

    create_and_signin_user(ENV['TEST_PASS'])
    visit root_path
    expect(page).to have_content 'Places I want to go'
  end
end