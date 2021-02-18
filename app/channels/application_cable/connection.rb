module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if verified_user = User.find_by(id: cookies.signed['user.id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end

# 3. Here we configure websocket connections
# In the find_verified_user method we access the cookie that we previously set in the warden hook.
# identified_by is a connection identifier that can be used to find the specific connection. Anything marked as an identifier will automatically create a delegate by the same name on any channel instances created off the connection.
