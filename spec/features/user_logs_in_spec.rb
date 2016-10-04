require 'spec_helper'
require 'rails_helper'
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

    expect(page).to have_content('You\'re in!')
    expect(page).to have_content('Sign Out')
  end
end
