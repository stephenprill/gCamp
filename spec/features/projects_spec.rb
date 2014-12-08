require 'rails_helper'


  feature "Projects" do

    scenario 'User signs up, logs in, creates, edits and deletes a project' do

      visit root_path
      click_on "Sign Up"
      fill_in("First name", {with: "Jameson"})
      fill_in "Last name", with: "Jones"
      fill_in "Email", with: "jameson@mail.com"
      fill_in "Password", with: "pass"
      fill_in "Password confirmation", with: "pass"
      click_on "Sign up"
      visit root_path
      expect(page).to have_content("Jameson Jones")

      visit root_path

      click_on "Projects"
      click_on "Create Project"
      click_on "Create Project"
      expect(page).to have_content("Name can't be blank")

      fill_in "Name", with: "New App"

      click_on "Create Project"
      expect(page).to have_content("New App was successfully created.")

      click_on "New App"
      click_on "Edit"

      fill_in "Name", with: "New App 2014"
      click_on "Create Project"
      expect(page).to have_content("New App 2014 was successfully updated.")

      click_on "Delete"
      expect(page).to have_content("New App 2014 was successfully destroyed.")
    end



end
