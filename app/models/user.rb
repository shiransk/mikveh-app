class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_one :mikveh
  
  validates :email, uniqueness: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }

end
