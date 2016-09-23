class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_one :mikveh
  has_many :posts 
  has_many :messages
  has_many :chat_rooms
  mount_uploader :image, ImageUploader
  
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }

  # current_user.all_chat_rooms
  # => self = current_user
  def all_chat_rooms
    chat_rooms = []

    self.chat_rooms.where("room_type NOT IN (?)", ["general_chat", "mikveh_chat"]).each do |room|
      chat_rooms << room
    end

    ChatRoom.where(recipient_id: self.id).each do |room|
      chat_rooms << room
    end
    
    return chat_rooms
  end

end
