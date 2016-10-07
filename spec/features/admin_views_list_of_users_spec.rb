require 'spec_helper'
require 'rails_helper'

feature 'admin views users' do
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:users) { FactoryGirl.create_list(:user, 5) }

  scenario 'an admin views link to admin controls' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    expect(page).to have_link("Admin Controls")
  end

  scenario 'an admin views list of all users' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link("Admin Controls")

    expect(page).to have_content("ALL USERS")
    users.each do |user|
      expect(page).to have_content(user.username)
    end
  end

  scenario 'a non-admin does not have access to admin controls link' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: users.first.email
    fill_in 'Password', with: users.first.password
    click_button 'Log in'
    visit users_path

    expect(page).to_not have_link("Admin Controls")
    expect(page).to have_content("Nice try but you do not have access to this page")
  end
end
