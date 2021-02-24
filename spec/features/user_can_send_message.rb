require 'rails_helper'
require 'methods'

RSpec.feature "Room", type: :feature do
  scenario "user can send a message" do
    visit "/"
    fill_in "user_email", with: "test@test.com"
    fill_in "user_password", with: "test123"
    click_button "Log in"
    
    click_button "Create a new room"
    fill_in "room_name", with: "My room"
    click_button "Create room"
    expect(page).to have_content("My room")
    click_button "My room"
    fill_in "room_message", with: "hi this is my new room"
    expect(page).to have_content("hi this is my new room")
  end
end
