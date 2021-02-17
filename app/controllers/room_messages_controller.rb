class RoomMessagesController < ApplicationController
   before_action :load_entities

  def create
    
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    
    # Every time a room message is being created, we broadcast to the message’s room stream
    
    # RoomChannel.broadcast_to @room, @room_message will broadcast to the room’s specific stream the @room_message is transformed to json via the to_json method.
    RoomChannel.broadcast_to @room, @room_message
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end

  
end
