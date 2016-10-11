require 'rails_helper'

feature 'email sent for added review' do
  scenario 'email sent when authenicated user adds new review successfully' do
    user = FactoryGirl.create(:user)
    district = FactoryGirl.create(:district)

    user_signs_in(user)

    click_link district.name
    click_link 'New Review'

    expect(page).to have_content "WRITE A NEW REVIEW"
    fill_in "Title", with: 'Terrible place to grow up'
    fill_in "Body", with: 'Look at how I turned up'
    fill_in "Rating", with: 1

    click_button "Submit"

    expect(page).to have_content("Review added successfully")
    expect(page).to have_content("Terrible place to grow up")
    expect(page).to have_content("Look at how I turned up")
    expect(page).to have_content("Rating: 1")
    expect(page).to have_content("Reviewer: #{user.username}")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
