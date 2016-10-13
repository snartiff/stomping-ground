require 'rails_helper'

feature 'unauthenticated user cannot edit district' do
  scenario 'user does not see edit and delete button for district' do
    district = FactoryGirl.create(:district)

    visit root_path
    click_link district.name
    expect(page).to have_content district.name
    expect(page).to have_content district.description
    expect(page).to_not have_content 'Edit District'
    expect(page).to_not have_content 'Delete District'
  end
end

feature 'authenticated user can edit district' do
  scenario 'user edits a district' do
    user = FactoryGirl.create(:user)
    district = FactoryGirl.create(:district, user_id: user.id)

    user_signs_in(user)
    visit root_path
    click_link district.name
    expect(page).to have_content district.name
    expect(page).to have_content district.description

    click_link 'Edit District'
    fill_in 'district_name', with: 'New district name'
    fill_in 'district_description', with: 'New district description'
    click_button 'Update District'

    expect(page).to have_content 'New district name'
    expect(page).to have_content 'New district description'
  end
end
