require 'rails_helper'


  feature "Users" do

    scenario 'User creates user' do
      visit users_path
      click_on "Create User"
      fill_in "First name", with: "Chaka"
      fill_in "Last name", with: "Khan"
      fill_in "Email", with: "chaka@mail.com"
      fill_in "Password", with: "pass"
      fill_in "Password confirmation", with: "pass"

      click_on "Create User"
      visit users_path
      expect(page).to have_content("Chaka Khan")

      click_on "Chaka Khan"
      click_on "Edit"
      fill_in "Last name", with: "KHAAAAAAN"
      click_on "Update User"
      visit users_path
      expect(page).to have_content("Chaka KHAAAAAAN")
      expect(page).to have_no_content("Chaka Khan")

      click_on "Chaka KHAAAAAAN"
      click_on "Edit"
      click_on "Delete User"
      expect(page).to have_no_content("Chaka KHAAAAAAN")

end

end
