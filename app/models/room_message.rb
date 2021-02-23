class RoomMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room, inverse_of: :room_messages



  # merge profile pic to json representation of the RoomMessage model
  def as_json(options)
    p "---------------the as_json method---------------"
    # p ActiveStorage::Blob.service.send(:path_for, user.avatar.key)

    # p Rails.application.routes.url_helpers.rails_blob_path(user.avatar.key)
    p "---------------end of activestorage method---------------"
    p super(options).merge(profile_pic_url: ActiveStorage::Blob.service.send(:path_for, user.avatar.key))
    super(options).merge(profile_pic_url: ActiveStorage::Blob.service.send(:path_for, user.avatar.key))
  end

  def created_at
    attributes['created_at'].strftime("%d %B, %l:%M%P")
  end

  def updated_at
    attributes['updated_at'].strftime("%d %B, %l:%M%P")
  end
end
