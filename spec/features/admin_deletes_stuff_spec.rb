require 'spec_helper'
require 'rails_helper'

feature 'admin deletes anything' do
  let!(:admin) { User.create(username: "Jewls",
                             first_name: "Julie",
                             last_name: "Grace",
                             email: "hello@test.com",
                             password: "password",
                             password_confirmation: "password",
                             role: "admin"
                            )
                }
  let!(:users) { FactoryGirl.create_list(:user, 5) }
  let!(:districts) {FactoryGirl.create_list(:district, 5) }
  let!(:review) { Review.create(title: 'Review me!', body: 'So amazing tests', rating: 5, district_id: districts.first.id, user_id: users.first.id) }

  scenario 'an admin deletes users when desired' do
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
    expect(page).to have_button("Delete")
  end

  scenario 'an admin deletes districts when desired' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'

    expect(page).to have_button("Delete")
  end

  scenario 'an admin deletes reviews when desired' do
    visit root_path
    click_link('Sign In')
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    click_link(districts.first.name)

    expect(page).to have_content(districts.first.name)
    expect(page).to have_button("Delete")
  end
end
