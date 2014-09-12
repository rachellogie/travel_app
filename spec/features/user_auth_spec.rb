require 'spec_helper'

feature 'user auth' do

  it 'user can register' do
    visit root_path
    click_on 'Register'
    fill_in 'Email', with: 'david@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'You have signed up successfully.'
  end

end