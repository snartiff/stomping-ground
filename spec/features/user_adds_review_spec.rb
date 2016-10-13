require 'rails_helper'

feature 'Authenticated user adds reviews' do
  scenario 'user adds new review successfully' do
    user = FactoryGirl.create(:user)
    district = FactoryGirl.create(:district)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link district.name
    click_link 'New Review'

    expect(page).to have_content "WRITE A NEW REVIEW"
    fill_in "Title", with: 'Terrible place to grow up'
    fill_in "Body", with: 'Look at how I turned up'
    fill_in "Rating", with: 1

    click_button 'Submit'

    expect(page).to have_content 'Review added successfully'
    expect(page).to have_content 'Terrible place to grow up'
    expect(page).to have_content 'Look at how I turned up'
    expect(page).to have_content "Rating: 1"
    expect(page).to have_content "#{user.username}"
  end

  scenario 'user does not fill in required information for a new review' do
    user = FactoryGirl.create(:user)
    district = FactoryGirl.create(:district)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link district.name
    click_link 'New Review'

    fill_in "Title", with: 'Terrible place to grow up'
    click_button 'Submit'

    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Rating is not a number"
  end
end
