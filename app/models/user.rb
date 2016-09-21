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

end
