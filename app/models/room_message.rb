class RoomMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  # merge profile pic to json representation of the RoomMessage model
  def as_json(options)
    super(options).merge(username: user.username)
  end

  def created_at
    attributes['created_at'].strftime("%d %B, %l:%M%P")
  end

  def updated_at
    attributes['updated_at'].strftime("%d %B, %l:%M%P")
  end
end
