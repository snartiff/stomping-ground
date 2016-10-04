require "rails_helper"

feature "un-registered user can add district" do
  scenario "visitor adds new district successfully" do
    visit new_district_path
    expect(page).to have_content "New District Form"

    fill_in 'Name', with: "Back Bay"

    click_button "Add District"
    expect(page).to have_content "District added successfully"
    expect(page).to have_content "Back Bay"
  end

  scenario "visitor does not fill in required information" do
    visit new_district_path

    click_button "Add District"
    expect(page).to have_content "Name can't be blank"
  end
end
