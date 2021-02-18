Warden::Manager.after_set_user do |user,auth,opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = user.id
end

Warden::Manager.before_logout do |user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = nil
end

# 2. Here we configure Devise application/gem for authenticating websocket connections
# This adds a cookie with the user’s id upon successful sign in and removes it once the user logs out.