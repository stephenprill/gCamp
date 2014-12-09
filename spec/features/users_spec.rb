require 'rails_helper'


  feature "Users" do

    scenario 'User creates, edits, deletes user' do
      visit users_path

      fill_in "First name", with: "Chaka"
      fill_in "Last name", with: "Khan"
      fill_in "Email", with: "chaka@mail.com"
      fill_in "Password", with: "pass"
      fill_in "Password confirmation", with: "pass"

      click_on "Sign up"
      visit users_path
      expect(page).to have_content("Chaka Khan")

      within 'table' do
        click_on "Chaka Khan"
      end

      click_on "Edit"
      fill_in "Last name", with: "KHAAAAAAN"
      click_on "Update User"
      visit users_path
      expect(page).to have_content("Chaka KHAAAAAAN")
      expect(page).to have_no_content("Chaka Khan")

      within 'table' do
        click_on "Chaka KHAAAAAAN"
      end

      click_on "Edit"
      click_on "Delete User"
      expect(page).to have_content("Chaka KHAAAAAAN was successfully deleted")
  end
end
