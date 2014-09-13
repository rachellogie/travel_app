require 'spec_helper'

feature 'locations' do

  before do
    create_and_signin_user(ENV['TEST_PASS'])
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

  scenario 'user can go to show page for each destination' do
    create_location
    visit root_path
    click_on 'Cuba'
    expect(page).to have_content 'Cuba'
  end

  scenario 'user can remove a destination from the list' do
    create_location
    visit root_path
    click_on 'Cuba'
    click_on 'Delete this destination'
    expect(page).to_not have_content 'Cuba'
  end

  scenario 'user can mark a destination as visited and they will see it under the visited column' do
    create_location
    visit root_path
    click_on 'Mark as visited'
    within('.visited') do
      expect(page).to have_content 'Cuba'
    end
    within('.desired') do
      expect(page).to_not have_content 'Cuba'
    end
  end
end
