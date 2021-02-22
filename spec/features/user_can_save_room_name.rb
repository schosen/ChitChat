require 'rails_helper'
require 'methods'

RSpec.feature "Name a chat room", type: :feature do
  scenario "User can create a room" do
    visit "/"
    click_link "Sign up"
    expect(page.current_path).to eq "/users/sign_up"
    user_log_in
    click_button "Sign up"
    click_link "Create a room"
    fill_in "room_name", with: "Hi!"
    click_button "Save"
    expect(page).to have_content("Hi!")
  end
end
