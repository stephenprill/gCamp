require 'rails_helper'

  feature "Tasks" do

    scenario 'User creates, edits and deletes task' do
      project1 = Project.create!(
        name: "Awesome Project"
      )

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
      visit projects_path(project1)
      click_on "Awesome Project"
      click_on "0 Tasks"
      click_on "New Task"
      fill_in "Description", with: "Organize Notes"
      fill_in "Due date", with: "02/11/2024"

      click_on "Create Task"
      visit project_task_path(project1)

      expect(page).to have_content("Organize Notes")

      click_on "Edit"

      fill_in "Description", with: "Organize Notes & Files"
      fill_in "Due date", with: "02/12/2014"
      check "Complete"

      click_on "Update Task"
      expect(page).to have_content("Task was successfully updated.")

      expect(page).to have_content("Organize Notes & Files")

      click_on "Edit"

      click_on "Back"

      find(".glyphicon-remove").click

      expect(page).to have_content("Task was successfully deleted")
    end
end
