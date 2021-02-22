def user_log_in
  fill_in "user_username", with: "arbnor1"
  fill_in "user_email", with: "test123@test.au"
  fill_in "user_password", with: "test123"
  fill_in "user_password_confirmation", with: "test123"
end

def user_fill_in
  fill_in "user_first_name", with: "Harry"
  fill_in "user_last_name", with: "Potter"
  fill_in "user_username", with: "Harry1"
  fill_in "user_email", with: "harrypotter@test.com"
  fill_in "user_password", with: "test123"
  fill_in "user_password_confirmation", with: "test123"
end
