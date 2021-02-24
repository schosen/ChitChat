class RoomMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  # merge profile pic to json representation of the RoomMessage model
  def as_json(options)
    p "---------------the as_json method---------------"
    p ActiveStorage::Blob.service.send(:path_for, user.avatar.key)
    p "---------------end of activestorage method---------------"
    p super(options).merge(profile_pic_url: user.user_avatar(user.id))
    super(options).merge(profile_pic_url: user.user_avatar(user.id))
  end

  def created_at
    attributes['created_at'].strftime("%d %B, %l:%M%P")
  end

  def updated_at
    attributes['updated_at'].strftime("%d %B, %l:%M%P")
  end
end
