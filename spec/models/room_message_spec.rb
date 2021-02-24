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
    user.id = User.new
    room.id = Room.new
    user.id = "1"
    room.id = "1"
    new_message.message = "Hello World!"
    expect(new_message).to be_valid
  end
end
