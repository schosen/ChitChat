class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rooms
  has_many :messages
  has_one_attached :avatar
  has_many :room_messages, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, uniqueness: true, presence: true

  def user_avatar(user_id)
   user = User.find(user_id)
   if user.avatar.attached?
      user.avatar
   else
       self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-profile.png")), filename: 'default-profile.png' , content_type: "image/png")
   end
  end


  #def add_default_avatar
  #  unless avatar.attached?
    #  self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-profile.png")), filename: 'default-profile.png' , content_type: "image/png")
    #end
  #end
end
