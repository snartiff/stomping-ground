require 'rails_helper'

feature "un-authenticated visitor sees a list of districts" do
  scenario "sees a list of districts and link for new district" do
    user = FactoryGirl.create(:user)
    back_bay = FactoryGirl.create(:district, user_id: user.id)
    cambridge = FactoryGirl.create(:district, name: "Cambridge", user_id: user.id)

    visit districts_path

    expect(page).to have_content back_bay.name
    expect(page).to have_link cambridge.name

    click_link "Add New District"

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "clicks link and is taken to show page for given district" do
    user = FactoryGirl.create(:user)
    back_bay = FactoryGirl.create(:district, user_id: user.id)

    visit root_path
    click_link "Back Bay"

    expect(page).to have_content back_bay.name
    expect(page).to have_content back_bay.description
    expect(page).to have_content user.username
  end
end
