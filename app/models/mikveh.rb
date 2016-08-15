class Mikveh < ApplicationRecord
  has_many :bookings
  has_one :user
end
