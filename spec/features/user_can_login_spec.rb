require 'rails_helper'

RSpec.feature "Account login", type: :feature do
  scenario "user can login into account" do
    visit "/"
    fill_in "Email", with: "arbnor1@test.com"
    fill_in "Password", with: "test123"
    click_button "Login"
    expect(page.current_path).to eq "/sessions"
  end
end

=begin
  scenario "invalid login" do
    visit "/"
    within_fieldset :log_in do
      fill_in "Email", with: "arbnor1@test.com"
      fill_in "Password", with: "wrong-password"
      click_button "Login"
    end
    expect(page).to have_content("Incorrect username or password")
  end
=end
