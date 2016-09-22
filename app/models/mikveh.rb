class Mikveh < ApplicationRecord
  has_many :bookings
  belongs_to :user
  geocoded_by :location  
  after_validation :geocode 
  mount_uploader :image, ImageUploader

  
  #  after_save do |mikveh|
  #   if ChatRoom.where(user_id: mikveh.user.id, type: "mikveh").empty?
  #     ChatRoom.create(user_id: mikveh.user.id, type: "mikveh") 
  #   end

  # end

end
