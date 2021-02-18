class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true

  def profile_pic
    url = "https://picsum.photos/id/#{1000 + id}/100/100"
  end

  def error_profile_pic
    url = "https://www.kirkham-legal.co.uk/wp-content/uploads/2017/02/profile-placeholder.png"
  end
end
