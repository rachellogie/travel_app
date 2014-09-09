require 'spec_helper'

feature 'homepage' do

  scenario 'it says the app name on the homepage' do
    visit root_path
    expect(page).to have_content 'Travel App'
  end

end