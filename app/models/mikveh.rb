class Mikveh < ApplicationRecord
  has_many :bookings
  belongs_to :user
  geocoded_by :location  
  after_validation :geocode 

end
