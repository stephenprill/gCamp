require 'rails_helper'


  feature "Tasks" do

    scenario 'User creates task' do
      visit tasks_path
      click_on "Create Task"
      fill_in "Description", with: "Organize Notes"
      fill_in "Due date", with: "02/13/2014"

      click_on "Create Task"
      visit tasks_path
      expect(page).to have_content("Organize Notes")
      # expect(page).to have_content("2014-02-13")

      click_on "Edit"

      fill_in "Description", with: "Organize Notes & Files"
      fill_in "Due date", with: "02/14/2014"
      check "Complete"

      click_on "Update Task"
      visit users_path
      expect(page).to have_content("Organize Notes & Files")
      expect(page).to have_content("true")
      expect(page).to have_content("02/14/2014")
      expect(page).to have_no_content("Organize Notes")
      expect(page).to have_no_content("02/13/2014")

      click_on "Back"
      find_field('Description').value
      find_link('Destroy').visible?
      find_button('Destroy').click
      click_on "Destroy"
      expect(page).to have_no_content("Organize Notes & Files")

end

end
