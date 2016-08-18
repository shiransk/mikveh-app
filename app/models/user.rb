class User < ApplicationRecord
  has_secure_password
  has_many :bookings
  has_one :mikveh

  validates :email, uniqueness: true

end
