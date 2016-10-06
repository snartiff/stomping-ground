require 'spec_helper'
require 'rails_helper'

feature 'updating profile show page' do
  scenario 'current user can view edit user page' do
    user = User.create(username: "Jewls", first_name: "Julie", last_name: "Grace", email: "hello@test.com", password: "password", password_confirmation: "password")

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Account'
    click_link 'Edit Profile'

    expect(page).to have_content('Edit')
    expect(page).to have_content('CANCEL MY ACCOUNT')
  end

  scenario 'current user can make edits to account' do
    user = User.create(username: "Jewls", first_name: "Julie", last_name: "Grace", email: "hello@test.com", password: "password", password_confirmation: "password")

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Account'
    click_link 'Edit Profile'
    fill_in 'Last name', with: 'Grace'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end
end
