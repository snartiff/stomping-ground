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
    click_link 'Delete'

    expect(page).to_not have_content(review.body)
    expect(page).to have_content("Review deleted")
  end

  # scenario 'user deletes own district successfully' do
  #   user = FactoryGirl.create(:user)
  #   district = FactoryGirl.create(:district)
  #
  #   visit root_path
  #   click_link 'Sign In'
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password
  #   click_button 'Log in'
  #
  #   click_link 'Add New District'
  #
  #   fill_in "Name", with: district.name
  #   fill_in "Description", with: district.description
  #
  #   click_button 'Add District'
  #   click_button 'Delete'
  #
  #   expect(page).to_not have_content(district.title)
  #   expect(page).to have_content("District deleted")
  # end
end
