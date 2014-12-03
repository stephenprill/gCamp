require 'rails_helper'


  feature "Projects" do

    scenario 'User creates, edits and deletes project' do
      visit root_path
      click_on "Projects"
      click_on "Create Project"
      fill_in "Name", with: "New App"

      click_on "Create Project"
      expect(page).to have_content("New App was successfully created")

      click_on "New App"
      click_on "Edit"

      fill_in "Name", with: "New App 2014"
      click_on "Update Project"
      expect(page).to have_content("New App 2014 was successfully updated")

      click_on "Delete"
      expect(page).to have_content("New App 2014 was successfully destroyed")
    end
end
