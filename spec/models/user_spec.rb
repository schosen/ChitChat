require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without password" do
    user = User.new
    user.username = "Harry"
    expect(user).to_not be_valid
  end

  it "is not valid without username" do
    user = User.new
    user.password= "test123"
    expect(user).to_not be_valid
  end

  it "is not valid with a repeated username" do
    user = User.new
    user.username = "arbnor1"
    user.password= "test1234"
    expect(user).to_not be_valid
  end

  it "is valid with valid attributes" do
    user = User.new
    user.username = "Harry"
    user.password = "test123"
    user.first_name = "Harry"
    user.last_name = "Potter"
    user.email = "harry1@test.com"
    user.password = "test123"
    user.password_confirmation = "test123"
    expect(user).to be_valid
  end
end
