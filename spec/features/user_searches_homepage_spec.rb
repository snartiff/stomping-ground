require 'spec_helper'
require 'rails_helper'

feature 'searching homepage' do
  scenario 'any user can search for a district by name' do
    district = FactoryGirl.create(:district)
    district2 = FactoryGirl.create(:district)
    visit root_path

    expect(page).to have_content district.name
    expect(page).to have_content district2.name

    fill_in 'search', with: district.name
    click_button "Search"
    expect(page).to have_content district.name
    expect(page).not_to have_content(district2.name)
  end
end
