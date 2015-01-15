require 'rails_helper'


  feature "Users" do

    scenario 'User can create user' do
      password = "password"
      user = create_user(:password => password)
      log_in(user, password)

      visit users_path

      click_on 'Create User'
      fill_in 'First name', with: 'Jimbo'
      fill_in 'Last name', with: 'Slice'
      fill_in 'Email', with: 'jimbo@slice.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Create User'

      expect(page).to have_content("Jimbo Slice was successfully created")
  end
end
