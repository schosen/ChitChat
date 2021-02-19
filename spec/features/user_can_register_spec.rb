require 'rails_helper'

RSpec.feature "Register account", type: :feature do
  scenario "user can sign up" do
    visit "/"
    click_link "Sign up"
    expect(page.current_path).to eq "/users/sign_up"
  end


  scenario "user can fill in sign up" do
    visit "/"
    click_link "Sign up"
    expect(page.current_path).to eq "/users/sign_up"
    fill_in "user_first_name", with: "Harry"
    fill_in "user_last_name", with: "Potter"
    fill_in "user_username", with: "Harry1"
    fill_in "user_email", with: "harrypotter@test.com"
    fill_in "user_password", with: "test123"
    fill_in "user_password_confirmation", with: "test123"
    click_button "Sign up"
    expect(page).to have_content("You can create or join a room from the sidebar.")
  end
end

RSpec.feature "Invalid sign up", type: :feature do
  scenario "no username" do
    visit "/"
    click_link "Sign up"
    expect(page.current_path).to eq "/users/sign_up"
    fill_in "user_password", with: "Password12"
    click_button "Sign up"
    expect(page).to have_content("can't be blank")
  end

  scenario "no password" do
    visit "/"
    click_link "Sign up"
    expect(page.current_path).to eq "/users/sign_up"
    fill_in "user_username", with: "Lotty"
    click_button "Sign up"
    expect(page).to have_content("can't be blank")
  end

  scenario "repeated username" do
    visit "/"
    click_link "Sign up"
    expect(page.current_path).to eq "/users/sign_up"
    fill_in "user_username", with: "arbnor1"
    fill_in "user_email", with: "test123@test.au"
    fill_in "user_password", with: "test123"
    fill_in "user_password_confirmation", with: "test123"
    click_button "Sign up"
    click_link "Logout"
    click_link "Sign up"
    fill_in "user_username", with: "arbnor1"
    fill_in "user_email", with: "test123@test.au"
    fill_in "user_password", with: "test123"
    fill_in "user_password_confirmation", with: "test123"
    click_button "Sign up"
    expect(page).to have_content("Please review the problems below:")
  end
end
