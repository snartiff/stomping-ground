require 'spec_helper'
require 'rails_helper'

feature 'admin views users' do
  scenario 'an admin views list of all users' do
    admin = User.create(username: "Jewls", first_name: "Julie", last_name: "Grace", email: "hello@test.com", password: "password", password_confirmation: "password", role: "admin")

    users = FactoryGirl.create_list(:user, 5)

    visit root_path
    click_link("All Users")

    expect(page).to have_content("All Users")
    users.each do |user|
      expect(page).to have_content(user.username)
    end
  end
end
