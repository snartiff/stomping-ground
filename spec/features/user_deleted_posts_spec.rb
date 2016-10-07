require 'rails_helper'

feature 'Authenticated user removes reviews' do
  scenario 'user deletes own review successfully' do
    user = FactoryGirl.create(:user)
    district = FactoryGirl.create(:district)
    review = FactoryGirl.create(:review)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link district.name
    click_link 'New Review'

    fill_in "Title", with: review.title
    fill_in "Body", with: review.body
    fill_in "Rating", with: review.rating

    click_button 'Submit'
    click_button 'Delete'

    expect(page).to_not have_content(review.body)
    expect(page).to have_content("Review deleted")
  end
end
