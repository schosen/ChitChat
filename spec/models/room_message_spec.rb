require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  it "is not valid without valid user" do
    new_message = RoomMessage.new
    new_message.message = "Hello World!"
    expect(new_message).not_to be_valid
  end

  it "is not valid without content" do
    new_message = RoomMessage.new
    new_message.user_id = "1"
    expect(new_message).not_to be_valid
  end

  it "is valid with valid attributes" do
    new_message = RoomMessage.new
    id = User.new
    room_id = Room.new
    new_message.message = "Hello World!"
    expect(new_message).to be_valid
  end
end
