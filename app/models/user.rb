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
  def single_chat_rooms
    chat_rooms = []

    self.chat_rooms.where("room_type NOT IN (?)", ["general_chat", "mikveh_chat"]).each do |room|
      chat_rooms << room
    end

    (ChatRoom.where(recipient_id: self.id).or(ChatRoom.where user_id: self.id)).each do |room|
      if room.recipient_id
      chat_rooms << room
    end
  end

    return chat_rooms.uniq
  end


  def mikveh_chat_rooms
    mikveh_chats = []

    mikvehs = Mikveh.where(id: self.bookings.pluck(:mikveh_id))

    mikvehs.each do |mikveh|
      if mikveh.chatroom
        mikveh_chats << mikveh.chatroom
      end
    end

    if self.mikveh && self.mikveh.chatroom && !mikveh_chats.include?(self.mikveh.chatroom)
      mikveh_chats << self.mikveh.chatroom
    end

    return mikveh_chats.uniq
  end

end
