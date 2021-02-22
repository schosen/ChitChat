require 'rails_helper'

RSpec.feature "Chat Room", type: :feature do
  scenario "Can send a message and view it" do
    visit "/"
    fill_in "post_content", with: "Hello, world!"
    click_button "New Post"
    expect(page).to have_content("Hello, world!")
  end
end
