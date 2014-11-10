require 'rails_helper'


  feature "Projects" do

    scenario 'User creates project' do
      visit projects_path
      click_on "Create Project"
      fill_in "Name", with: "New App"

      find_button('Create Project').click
      visit projects_path
      expect(page).to have_content("New App")

      click_on "New App"
      click_on "Edit"

      fill_in "Name", with: "New App 2014"
      click_on "Update Project"

      visit projects_path
      expect(page).to have_content("New App 2014")
      expect(page).to have_no_content("New App")

      find_button('Destroy').click
      click_on "OK"
      expect(page).to have_content("Project was successfully destroyed")
      expect(page).to have_no_content("New App 2014")

end

end
