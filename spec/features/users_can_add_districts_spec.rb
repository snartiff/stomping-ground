require "rails_helper"

feature "only registered user can add district" do
  scenario "user adds new district successfully" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Add New District'
    expect(page).to have_content "NEW DISTRICT FORM"

    fill_in 'Name', with: "Back Bay"
    fill_in 'Description', with: "Lovely Back Bay"

    click_button "Add District"
    expect(page).to have_content "District added successfully"
    expect(page).to have_content "Back Bay"
    expect(page).to have_content "Lovely Back Bay"
  end

  scenario "user does not fill in required information" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_district_path

    click_button "Add District"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario "pictures are optionally included for each district" do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link("Add New District")
    fill_in 'Name', with: "Back Bay"
    fill_in 'Description', with: "Lovely Back Bay"
    attach_file :district_avatar, "#{Rails.root}/spec/support/images/dog_test.png"
    click_button 'Add District'

    expect(page).to have_css("img[src*='dog_test.png']")
  end
end
