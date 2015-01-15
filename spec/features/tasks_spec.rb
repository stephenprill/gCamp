require 'rails_helper'

  feature "Tasks" do

    scenario 'Owner creates, edits and deletes task' do
      project1 = Project.create!(
        name: "Awesome Project"
      )
      password = "password"
      user = create_user(:password => password)
      create_membership(user, project1, 'owner')
      log_in(user, password)
      expect(page).to have_content(user.full_name)

      visit project_path(project1)
      click_on "0 Tasks"
      click_on "New Task"
      fill_in "Description", with: "Organize Notes"
      fill_in "Due date", with: "02/11/2024"

      click_on "Create Task"

      expect(page).to have_content("Organize Notes")

      click_on "Edit"

      fill_in "Description", with: "Organize Notes & Files"
      fill_in "Due date", with: "02/12/2014"
      check "Complete"

      click_on "Update Task"
      expect(page).to have_content("Task was successfully updated.")

      expect(page).to have_content("Organize Notes & Files")
      visit project_tasks_path(project1)
      find(".glyphicon-remove").click

      expect(page).to have_content("Task was successfully deleted")
    end
end
