require 'spec_helper'
require 'rails_helper'

feature 'viewing profile show page' do
  scenario 'current user views own profile account page' do
    user = User.create(username: "Jewls", first_name: "Julie", last_name: "Grace", email: "hello@test.com", password: "password", password_confirmation: "password", role: 'member')

    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Account'

    expect(page).to have_content('Back to Districts')
    expect(page).to have_content('Edit Profile')
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
  end
end
