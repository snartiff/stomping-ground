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
    fill_in 'Password Confirmation', with: user.password_confirmation
    click_button 'Sign Up'

    expect(page).to have_content('You\'re in!')
    expect(page).to have_content('Sign Out')
  end

  scenario 'required information is not supplied' do
    user_2 = User.new(username: "annz", first_name: "Annie", last_name: "Kim", password: "password", password_confirmation: "password")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user_2.username
    fill_in 'First Name', with: user_2.first_name
    fill_in 'Last Name', with: user_2.last_name
    fill_in 'Password', with: user_2.password
    fill_in 'Password Confirmation', with: user_2.password_confirmation
    click_button 'Sign Up'

    expect(page).to have_content('1 error prohibited this user from being saved')
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario 'password confirmation does not match password field' do
    user_3 = User.new(username: "snartiff", first_name: "Seanz", last_name: "N", email: "iamsean@gmail.com", password: "password", password_confirmation: "notpassword")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user_3.username
    fill_in 'First Name', with: user_3.first_name
    fill_in 'Last Name', with: user_3.last_name
    fill_in 'Email', with: user_3.email
    fill_in 'Password', with: user_3.password
    fill_in 'Password Confirmation', with: user_3.password_confirmation
    click_button 'Sign Up'

    expect(page).to have_content('1 error prohibited this user from being saved')
    expect(page).to have_content('Password confirmation doesn\'t match Password')
  end

  scenario 'user account is successfully registered if all form fields are passing' do
    user_4 = User.new(username: "holdenwood", first_name: "Kyle", last_name: "Wood", email: "iamsocool@test.com", password: "password", password_confirmation: "password")

    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: user_4.username
    fill_in 'First Name', with: user_4.first_name
    fill_in 'Last Name', with: user_4.last_name
    fill_in 'Email', with: user_4.email
    fill_in 'Password', with: user_4.password
    fill_in 'Password Confirmation', with: user_4.password_confirmation
    click_button 'Sign Up'

    expect(page).to have_content('You\'re in! You have signed up successfully.')
    expect(page).to have_content('Sign Out')
  end
end
