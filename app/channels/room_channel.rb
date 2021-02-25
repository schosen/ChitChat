
class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room]
    stream_for room
  end


end

# 4. Here we create a room channel. A channel encapsulates a logical unit of work, similar to what a controller does in a regular MVC setup.

# The subscribed method gets called once a subscription to the channel is established and it is responsible to setup the stream from which data will be sent back and forth.

# Use stream_for: Rails automatically generates a stream name for the given object (room in our case), for example: “room:kjafwer567”. When we want afterwards to broadcast data to the stream, all we have to do is call RoomChannel.broadcast_to(room_object, data) in which case Rails resolves the stream name from the room_object. In other words, we don’t have to manually resolve the stream name in which the data have to be send. This option is available when the channel handles subscriptions bound to models like in our case, a specific room