require 'rails_helper'

RSpec.feature "Account login", type: :feature do
  scenario "user can login into account" do
    visit "/"
    fill_in "Email", with: "arbnor1@test.com"
    fill_in "Password", with: "test123"
    click_button "Log in"
    expect(page.current_path).to eq "/users/sign_in"
  end

  scenario "invalid login" do
    visit "/"
    fill_in "Email", with: "arbnor1@test.com"
    fill_in "Password", with: "wrong-password"
    click_button "Log in"
    expect(page.current_path).to eq "/users/sign_in"
  end
end
