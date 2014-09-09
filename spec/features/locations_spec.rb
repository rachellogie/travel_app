require 'spec_helper'

feature 'homepage' do

  scenario 'user can add a desired destination' do
    visit root_path
    click_on 'Add desired destination'
    fill_in 'Country', with: 'Cuba'
    click_on 'Add'
    within('.desired') do
      expect(page).to have_content 'Cuba'
    end
  end

  scenario 'user can go to show page for each destination' do
    create_location
    visit root_path
    click_on 'Cuba'
    expect(page).to have_content 'Cuba'
  end

  scenario 'user can remove a destination from the list'
end
