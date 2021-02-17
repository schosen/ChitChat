# A channel encapsulates a logical unit of work, similar to what a controller does in a regular MVC setup.
class RoomChannel ApplicationCable::Channel
  def subscribed
    room = Room.find params[:room]
    stream_for room
  end
end

# The subscribed method gets called once a subscription to the channel is established and it is responsible to setup the stream from which data will be sent back and forth.