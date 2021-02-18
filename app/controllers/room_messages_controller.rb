class RoomMessagesController < ApplicationController
   before_action :load_entities

  def create
    
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
    
    RoomChannel.broadcast_to @room, @room_message
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_message, :room_id)
  end

  
end

# 5. here we broadcast room message to room stream after creating it
# we added the line RoomChannel.broadcast_to @room, @room_message which will broadcast to the room’s specific stream the @room_message transformed to json via the to_json method.