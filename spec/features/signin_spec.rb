require 'rails_helper'


  feature "Signup" do
    scenario 'User signsup' do
    visit root_path
    click_on "Sign Up"
    fill_in "First name", with: "Jameson"
    fill_in "Last name", with: "Jones"
    fill_in "Email", with: "jameson@mail.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"

    click_on "Sign up"
    visit root_path
    expect(page).to have_content("Jameson Jones")

  end





end
