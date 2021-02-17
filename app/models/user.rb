class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def profile_pic(size)
    url = "https://picsum.photos/id/#{1000 + id}/#{size}/#{size}"
  end

  def error_profile_pic
    url = "https://www.kirkham-legal.co.uk/wp-content/uploads/2017/02/profile-placeholder.png"
  end
end
