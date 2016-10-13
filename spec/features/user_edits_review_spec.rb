require 'rails_helper'

feature 'unauthenticated user cannot edit review' do
  scenario 'user does not see edit and delete button for review' do
    district = FactoryGirl.create(:district)
    review = FactoryGirl.create(:review, district_id: district.id)

    visit root_path
    click_link district.name
    expect(page).to have_content 'Title: Best neighborhood ever'
    expect(page).to have_content 'Rating: 5'
    expect(page).to_not have_content 'Edit Review'
    expect(page).to_not have_content 'Delete Review'
  end
end

feature 'authenticated user can edit review' do
  scenario 'user edits a review' do
    user = FactoryGirl.create(:user)
    district = FactoryGirl.create(:district)
    review = FactoryGirl.create(:review, district_id: district.id, user_id: user.id)

    user_signs_in(user)
    visit root_path
    click_link district.name
    expect(page).to have_content district.name
    expect(page).to have_content 'Lived here my whole life and it\'s been amazing'
    expect(page).to have_content 'Title: Best neighborhood ever'

    click_link 'Edit Review'
    fill_in 'review_title', with: 'New review title'
    fill_in 'review_body', with: 'I changed my review'
    click_button 'Submit'
    expect(page).to have_content 'New review title'
    expect(page).to have_content 'I changed my review'
  end
end
