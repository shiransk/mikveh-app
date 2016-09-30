class Mikveh < ApplicationRecord
  has_many :bookings
  belongs_to :user
  geocoded_by :location  
  after_validation :geocode 
  mount_uploader :image, ImageUploader

  
  # after_save do |mikveh|
  #   if ChatRoom.where(user_id: mikveh.id, room_type: "mikveh_chat").empty?
  #     ChatRoom.create(user_id: mikveh.id, room_type: "mikveh_chat") 
  #   end
  # end
  
  def chatroom
    return ChatRoom.find_by(user_id: self.user_id, room_type: 'mikveh_chat')
  end
end
