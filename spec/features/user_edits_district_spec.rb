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

feature 'authenticated user leaves edit field blank' do
  scenario 'description is left blank' do
    user = FactoryGirl.create(:user)
    district = FactoryGirl.create(:district, user_id: user.id)

    user_signs_in(user)
    visit root_path
    click_link district.name
    expect(page).to have_content district.name
    expect(page).to have_content district.description

    click_link 'Edit District'
    fill_in 'district_description', with: ''
    fill_in 'district_name', with: ''
    click_button 'Update District'

    expect(page).to have_content '2 errors prohibited this district from being saved:'
    expect(page).to have_content 'Description can\'t be blank'
    expect(page).to have_content 'Name can\'t be blank'
  end
end
