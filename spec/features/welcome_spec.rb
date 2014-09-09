require 'spec_helper'

feature 'homepage' do

  scenario 'it says the app name on the homepage' do
    visit root_path
    expect(page).to have_content 'Travel App'
  end

  scenario 'user can add a desired destination' do
    visit root_path
    click_on 'Add desired destination'
    fill_in 'Country', with: 'Cuba'
    click_on 'Add'
    within('.desired') do
      expect(page).to have_content 'Cuba'
    end
  end

end