require 'rails_helper'

feature "un-authenticated visitor sees a list of districts" do
  scenario "sees a list of districts and link for new district" do
    back_bay = District.create(name: "Back Bay")
    cambridge = District.create(name: "Cambridge")

    visit districts_path

    expect(page).to have_content "Back Bay"
    expect(page).to have_link "Cambridge"

    click_link "Add New District"

    expect(page).to have_content "New District Form"
  end

  scenario "clicks link and is taken to show page for given district" do
    back_bay = District.create(name: "Back Bay")

    visit root_path

    click_link "Back Bay"

    expect(page).to have_content back_bay.name
  end
end
