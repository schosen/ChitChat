class RoomMessage < ApplicationRecord
  attr_accessor :avatar_url
  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  # merge profile pic to json representation of the RoomMessage model
  def as_json(options)
    h = super(options).merge(username: user.username)
    h[:avatar_url] = Rails.application.routes.url_helpers.rails_blob_path(user.avatar)
    h
  end

  def created_at
    attributes['created_at'].strftime("%d %B, %l:%M%P")
  end

  def updated_at
    attributes['updated_at'].strftime("%d %B, %l:%M%P")
  end
end
