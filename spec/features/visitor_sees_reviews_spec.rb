require 'rails_helper'

feature 'unauthenticated visitor sees reviews' do
  scenario 'visitor views district homepage' do
    district = FactoryGirl.create(:district)

    visit root_path

    expect(page).to have_content district.name
  end

  scenario 'visitor views district reviews' do
    district = FactoryGirl.create(:district)
    review = FactoryGirl.create(:review, district_id: district.id)

    visit root_path
    click_link district.name
    expect(page).to have_content district.name
    expect(page).to have_content review.title
    expect(page).to have_content review.body
    expect(page).to have_content review.rating
    expect(page).to have_content review.user.username
  end

  scenario 'visitor fails to add review' do
    district = FactoryGirl.create(:district)

    visit root_path
    click_link district.name
    expect(page).to have_content district.name
    click_link 'New Review'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
    expect(page).to have_content 'LOG IN'
  end
end
