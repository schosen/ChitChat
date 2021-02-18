require 'rails_helper'

RSpec.feature "Register account", type: :feature do
  scenario "user can sign up" do
    visit "/"
    click_button "Sign Up"
    expect(page.current_path).to eq "/signup"
  end


  scenario "user can fill in sign up" do
    visit "/signup"
    within_fieldset :sign_up do
      fill_in "user_first_name", with: "Harry"
      fill_in "user_last_name", with: "Potter"
      fill_in "user_username", with: "Harry1"
      fill_in "user_email", with: "harrypotter@test.com"
      fill_in "user_password", with: "test123"
      fill_in "user_password_confirmation", with: "test123"

      click_button "Create User"
    end
    expect(page).to have_content("You have signed up")
end
