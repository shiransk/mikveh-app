class Booking < ApplicationRecord
  belongs_to :mikveh
  belongs_to :user
end
