require 'spec_helper'

feature 'Visited Trips' do

  before do
    @cuba = create(:country)
    @user = create_and_signin_user(ENV['TEST_PASS'])
    create_trip(@cuba, @user, true)
  end

  scenario 'user can add a date to a visited trip' do
    visit root_path
    click_on 'Cuba'
    click_on 'Edit details about your Cuba trip'
    fill_in 'Date visited', with: 6.months.ago
    click_on 'Update'
    expect(page).to have_content 6.months.ago.strftime('%B %d, %Y')
  end
end