require 'spec_helper'

feature 'trips' do

  before do
    @cuba = create(:country)
    @mexico = create(:country, name: 'Mexico')
    @user = create_and_signin_user(ENV['TEST_PASS'])
    create_trip(@cuba, @user)
  end

  scenario 'user can add a desired trip' do
    visit root_path
    click_on 'Add desired trip'
    fill_in 'Country', with: 'Denmark'
    click_on 'Add'
    within('.desired') do
      expect(page).to have_content 'Denmark'
    end
  end

  scenario 'user can go to show page for each trip' do
    visit root_path
    click_on 'Cuba'
    expect(page).to have_content 'Cuba'
  end

  scenario 'user can remove a trip from the list' do
    visit root_path
    click_on 'Cuba'
    click_on 'Delete this trip'
    expect(page).to_not have_content 'Cuba'
  end

  scenario 'user can mark a trip as visited and they will see it under the visited column' do
    visit root_path
    click_on 'Mark as visited'
    within('.visited') do
      expect(page).to have_content 'Cuba'
    end
    within('.desired') do
      expect(page).to_not have_content 'Cuba'
    end
  end

  scenario 'user will only see their own trips, not other peoples' do
    user2 = create(:user, email: 'something@a.com')
    create_trip(@mexico, user2)
    visit root_path
    expect(page).to have_content 'Cuba'
    expect(page).to_not have_content 'Mexico'
  end
end
