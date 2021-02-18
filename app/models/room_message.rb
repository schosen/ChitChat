class RoomMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  def as_json(options)
    super(options).merge(profile_pic_url: user.profile_pic)
  end
end
