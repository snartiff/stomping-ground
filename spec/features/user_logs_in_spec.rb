require 'spec_helper'
require 'rails_helper'

feature 'user creates account' do
  scenario 'specifies valid and required information' do
    user = User.new(username: "Jewls", first_name: "Julie", last_name: "Grace", email: "hello@test.com", password: "password", password_confirmation: "password")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user.username
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password
    click_button 'Sign Up'

    expect(page).to have_content('You\'re in!')
    expect(page).to have_content('Sign Out')
  end
end
