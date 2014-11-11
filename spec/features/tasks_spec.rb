require 'rails_helper'

  feature "Tasks" do

    scenario 'User creates, edits, deletes task' do
      visit tasks_path
      click_on "Create Task"
      fill_in "Description", with: "Organize Notes"
      fill_in "Due date", with: "02/11/2014"

      click_on "Create Task"
      visit tasks_path
      expect(page).to have_content("Organize Notes")
      # expect(page).to have_content("2014-02-11")

      click_on "Edit"
      fill_in "Description", with: "Organize Notes & Files"
      fill_in "Due date", with: "02/12/2014"
      check "Complete"

      click_on "Update Task"
      expect(page).to have_content("Task was successfully updated.")
      click_on "Back"
      click_on "Destroy"
      expect(page).to have_content("Task was successfully deleted")



end

end
