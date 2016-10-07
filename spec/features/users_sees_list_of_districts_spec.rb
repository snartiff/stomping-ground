require 'rails_helper'

feature "un-authenticated visitor sees a list of districts" do
  scenario "sees a list of districts and link for new district" do
    back_bay = FactoryGirl.create(:district)
    cambridge = FactoryGirl.create(:district, name: "Cambridge")

    visit districts_path

    expect(page).to have_content back_bay.name
    expect(page).to have_link cambridge.name

    click_link "Add New District"

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "clicks link and is taken to show page for given district" do
    back_bay = FactoryGirl.create(:district)

    visit root_path
    click_link back_bay.name

    expect(page).to have_content back_bay.name
    expect(page).to have_content back_bay.description
    expect(page).to have_content back_bay.user.username
  end
end
