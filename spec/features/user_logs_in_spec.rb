require 'spec_helper'

feature 'sign up' do
  scenario 'specifies valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Annie'
    fill_in 'Last Name', with: 'Kim'
    fill_in 'Email', with: 'anniehckim@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("You're in!")
    expect(page).to have_content("Sign Out")
  end

  scenario "required information is not supplied" do

  end

  scenario "password confirmation does not match password field" do

  end

  scenario "sees error messages if form is not filled out correctly" do

  end

  scenario "user account is successfully registered if all form fields are filled out correctly" do

  end
end
