require 'rails_helper'


  feature "Projects" do

    scenario 'User signs up, creates, edits and deletes a project' do

      visit root_path
      click_on "Sign Up"
      fill_in("First name", {with: "Jameson"})
      fill_in "Last name", with: "Jones"
      fill_in "Email", with: "jameson@mail.com"
      fill_in "Password", with: "pass"
      fill_in "Password confirmation", with: "pass"
      click_on "Sign up"
      expect(page).to have_content("Jameson Jones")

      click_on "Create Project"
      expect(page).to have_content("Name can't be blank")

      fill_in "Name", with: "New App"

      click_on "Create Project"
      expect(page).to have_content("New App was successfully created.")

      within '.breadcrumb' do
        click_on "New App"
      end

      click_on "Edit"

      fill_in "Name", with: "New App 2014"
      click_on "Create Project"
      expect(page).to have_content("New App 2014 was successfully updated.")

      click_on "Delete"
      expect(page).to have_content("New App 2014 was successfully destroyed.")
    end

    scenario "Only Project Owners can delete projects" do
      password = 'password'
      owner = create_user(
        :password => password)
      member = create_user(
        :email => "member@example.com",
        :password => password
        )
      project = create_project
      create_membership(owner, project, 'owner')
      create_membership(member, project)

      log_in(member, password)
      visit project_path(project)
      expect(page).to_not have_content('Delete')

      log_out
      log_in(owner, password)
      visit project_path(project)
      expect(page).to have_content('Delete')
      click_on 'Delete'
      expect(page).to have_content('Project was successfully destroyed.')
    end
end
